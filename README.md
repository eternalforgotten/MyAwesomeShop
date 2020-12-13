# -myAwesomeShop
This project is base on RoR for individual task

Инструкция по запуску сервера

Установить docker и docker-compose

Выполнить команды:

docker-compose build

docker-compose run api bundle

docker-compose run api rails db:create

docker-compose run api rails db:migrate

docker-compose up -d   (поднятие сервера)

docker-compose stop    (остановка сервера)
