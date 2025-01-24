#!/bin/bash
export LOCAL_IP=$(hostname -I | awk '{print $1}')
export EXTERNAL_IP=$(curl -s ifconfig.me)

# Название сети
NETWORK_NAME="lan"
NETWORK_TYPE="bridge"

# Проверка наличия сети
network_exists=$(docker network ls --filter "name=^${NETWORK_NAME}$" --format "{{.Name}}")

if [ "$network_exists" == "$NETWORK_NAME" ]; then
  echo "Сеть c именем $NETWORK_NAME уже существует."
else
  echo "Сеть c именем $NETWORK_NAME не найдена. Создаём новую сеть..."
  docker network create --driver $NETWORK_NAME $NETWORK_TYPE
  
  if [ $? -eq 0 ]; then
    echo "Сеть $NETWORK_NAME успешно создана."
  else
    echo "Ошибка при создании сети $NETWORK_NAME."
  fi
fi
echo $LOCAL_IP
echo $EXTERNAL_IP
docker-compose -f efk.compose.yml build
docker-compose -f app.compose.yml build
docker-compose -f efk.compose.yml -p rbmdkrfinalefk up -d
sleep 15
docker-compose -f app.compose.yml -p rbmdkrfinalapp up -d