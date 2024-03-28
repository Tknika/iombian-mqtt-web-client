#!/bin/bash

set -e

if [[ -n "${DEFAULT_BROKER_HOST}" ]]; then
    sed -i "s/input id=\"urlInput\" type=\"text\" value=\".*\"/input id=\"urlInput\" type=\"text\" value=\"${DEFAULT_BROKER_HOST}\"/g" /app/index.html
fi

if [[ -n "${DEFAULT_BROKER_PORT}" ]]; then
    sed -i "s/input id=\"portInput\" type=\"text\" value=\"[0-9]*\"/input id=\"portInput\" type=\"text\" value=\"${DEFAULT_BROKER_PORT}\"/g" /app/index.html
fi

if [[ "${DEFAULT_SSL_CONNECTION}" = false ]]; then
    sed -i "s/input id=\"sslInput\" type=\"checkbox\" checked=\"checked\"\/>/input id=\"sslInput\" type=\"checkbox\"\/>/g" /app/index.html
else
    sed -i "s/input id=\"sslInput\" type=\"checkbox\"\/>/input id=\"sslInput\" type=\"checkbox\" checked=\"checked\"\/>/g" /app/index.html
fi

exec "$@"