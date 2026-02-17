import argparse
import subprocess
import datetime
import os
import sys
from dotenv import load_dotenv
import requests


def parse_args():
    parser = argparse.ArgumentParser(description="Backup Postgres DB and send to Telegram")
    parser.add_argument(
        "--env-file", "-e",
        default=None,
        metavar="PATH",
        help="Path to .env file (default: .env in current directory)",
    )
    return parser.parse_args()


args = parse_args()
if args.env_file:
    load_dotenv(args.env_file)
else:
    load_dotenv()

CONTAINER_NAME = os.getenv("CONTAINER_NAME")
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_USER")
BACKUP_DIR = os.path.expanduser(os.getenv("BACKUP_DIR"))
BOT_TOKEN = os.getenv("TOKEN")
CHAT_ID = os.getenv("CHAT_ID")

os.makedirs(BACKUP_DIR, exist_ok=True)
timestamp = datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
backup_file = os.path.join(BACKUP_DIR, f"{DB_NAME}_{timestamp}.sql")


command = [
    "docker", "exec", CONTAINER_NAME,
    "pg_dump",
    "-U", DB_USER,
    DB_NAME
]

try:
    with open(backup_file, "wb") as f:
        process = subprocess.run(command, stdout=f, stderr=subprocess.PIPE)
    
    if process.returncode != 0:
        os.remove(backup_file)
        error_msg = process.stderr.decode()
        requests.post(
            f"https://api.telegram.org/bot{BOT_TOKEN}/sendMessage",
            data={"chat_id": CHAT_ID, "text": f"❌ Ошибка дампа базы:\n{error_msg}"}
        )
        sys.exit(1)

except Exception as e:
    requests.post(
        f"https://api.telegram.org/bot{BOT_TOKEN}/sendMessage",
        data={"chat_id": CHAT_ID, "text": f"❌ Скрипт дампа упал:\n{str(e)}"}
    )
    sys.exit(1)

with open(backup_file, "rb") as f:
    response = requests.post(
        f"https://api.telegram.org/bot{BOT_TOKEN}/sendDocument",
        data={"chat_id": CHAT_ID},
        files={"document": f}
    )

if response.status_code != 200:
    requests.post(
        f"https://api.telegram.org/bot{BOT_TOKEN}/sendMessage",
        data={"chat_id": CHAT_ID, "text": f"⚠️ Не удалось отправить дамп в Telegram:\n{response.text}"}
    )
