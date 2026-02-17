# Simple DB Backup

## Описание

Simple DB Backup помогает автоматически делать бэкапы Postgres БД, которая запущена в докере. Файл с бэкапом отправляет в ЛС чат телеграмма. 

## Настройка и запуск

В `.env.example` перечислены переменные, которые нужно заполнить в вашем файле `.env`.

1) В BotFather создать бота и скопировать API токен в `TOKEN` файла `.env`.
2) Чтобы узнать свой `CHAT_ID`:
   - Перейти по ссылке `https://api.telegram.org/bot<BOT_TOKEN>/getUpdates`
   - Отправить что-то боту
   - Скопировать `chat.id` в переменную `CHAT_ID`
3) Значения переменных `CONTAINER_NAME`, `DB_NAME`, `DB_USER`, `BACKUP_DIR` индивидуальны.

### Запуск через Docker

Образ доступен на Docker Hub. Контейнеру нужен доступ к Docker-сокету хоста (чтобы выполнять `docker exec` к контейнеру с БД) и к вашему `.env`. Каталог для бэкапов смонтируйте volume и укажите тот же путь в `BACKUP_DIR` в `.env`.

**Скачать образ и запустить:**
```bash
docker pull sariya10/simple-backup:latest
docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /путь/к/вашему/.env:/app/.env:ro \
  -v /путь/к/бэкапам:/backup \
  USERNAME/simple-backup:latest --env-file /app/.env
```

В `.env` укажите `BACKUP_DIR=/backup` (или тот путь, который смонтировали вторым `-v`).

Путь к `.env` можно задать любым: смонтируйте файл в контейнер и передайте его в `--env-file`, например:
```bash
docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /home/user/my.env:/config/my.env:ro \
  -v /data/backups:/backup \
  USERNAME/simple-backup:latest --env-file /config/my.env
```

**Cron (запуск по расписанию):**
```bash
0 3 * * * docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /path/to/.env:/app/.env:ro -v /path/to/backup:/backup USERNAME/simple-backup:latest --env-file /app/.env >> /path/to/backup.log 2>&1
```

*Альтернатива: собрать образ из исходников — `docker build -t simple-backup .` и в командах выше использовать `simple-backup` вместо `USERNAME/simple-backup:latest`.*

### Запуск без Docker (на хосте)

1) В `run.sh` укажите полные пути до `main.py` и интерпретатора Python.
2) Сделайте файл исполняемым: `chmod +x /path/to/run.sh`.
3) При необходимости укажите путь к .env: `python main.py --env-file /path/to/.env`.
4) Добавьте задачу в cron: `crontab -e` → `0 3 * * * /path/to/run.sh >> /path/to/backup.log 2>&1`.

Готово.
 