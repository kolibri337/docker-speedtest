export LOCAL_IP=$(hostname -I | awk '{print $1}')
export EXTERNAL_IP=$(curl -s ifconfig.me)
docker-compose -f app.compose.yml -p rbmdkrfinalapp down
docker-compose -f efk.compose.yml -p rbmdkrfinalefk down
