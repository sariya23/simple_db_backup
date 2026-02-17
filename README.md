# Simple DB Backup

## Description

Simple DB Backup helps automatically create backups of a Postgres database running in Docker. The backup file is sent to a Telegram private chat.

## Setup and запуск

The `.env.example` file lists the variables that must be filled in your `.env` file.

1. Create a bot using BotFather and copy the API token into the `TOKEN` variable in the `.env` file.
2. To find your `CHAT_ID`:

   * Open the link `https://api.telegram.org/bot<BOT_TOKEN>/getUpdates`
   * Send any message to the bot
   * Copy `chat.id` into the `CHAT_ID` variable
3. The values for `CONTAINER_NAME`, `DB_NAME`, `DB_USER`, `BACKUP_DIR`, and `POSTGRES_PORT` are specific to your setup.

### Running a backup

For convenience, you can place the application launch command in a `.sh` script:

```sh
#!/bin/bash

source /path/to/bin/python/execute
python /path/to/execute/script --env-file=/path/to/env/file
```

The env file should be specified so that it is easy to create backups of multiple databases on the same VPS.
