#!/bin/sh

if [[ -z "$1" ]]; then
    echo "token is required to run this action"
    exit 126
fi

if [[ -z "$2" ]]; then
    echo "peer_id is required to run this action"
    exit 126
fi

if [[ -z "$3" ]]; then
    message="🔔 Workflow завершён%0A%0A📃 Название: $GITHUB_WORKFLOW%0A📚 Репозиторий: $GITHUB_REPOSITORY%0A🌳 Ветка: ${GITHUB_REF##*/}"
else
    message="$3"
fi

params="access_token=$1&v=5.131&random_id=0&peer_id=$2&message=$message"

curl -d "$params" https://api.vk.com/method/messages.send