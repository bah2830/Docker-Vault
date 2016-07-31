APP_NAME=vault

RUN_FLAG="-d --restart=always"
if [ "$1" == "debug" ]; then
    RUN_FLAG="--rm"
fi

DATA_DIR=""
if [ -d /Storage/www/database/vault ]; then
    DATA_DIR="-v /Storage/www/database/vault:/vault/file"
fi

CONFIG_FILE="-v ${PWD}/config.conf:/config.conf"
if [ -f /Storage/www/vault_config.conf ]; then
    CONFIG_FILE="-v /Storage/www/vault_config.conf:/config.conf"
fi

echo "Building $APP_NAME image"
docker build -t $APP_NAME .

echo "Removing $APP_NAME container if it exists"
docker rm -f $APP_NAME

echo "Running $APP_NAME container"
docker run $RUN_FLAG --name $APP_NAME \
    -p 8200:8200 \
    --cap-add=IPC_LOCK \
    $CONFIG_FILE \
    $DATA_DIR \
    $APP_NAME server -config /config.conf
