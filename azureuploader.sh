#!/bin/bash

ACCOUNT_NAME=""
CONTAINER_NAME=""
BLOB_NAME=""
FILE_PATH=()

while getopts ":a:c:b:f:" opt; do
    case $opt in
        a)
            ACCOUNT_NAME=$OPTARG
            ;;
        c)
            CONTAINER_NAME=$OPTARG
            ;;
        b)
            BLOB_NAME=$OPTARG
            ;;
        f)
            FILE_PATH=$OPTARG
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

if ! az account show &>/dev/null; then
    echo "Azure CLI is not authenticated. Please run 'az login' to authenticate."
    exit 1
fi

if [ -z "$ACCOUNT_NAME"] || [ -z "$CONTAINER_NAME"] || [ ${#FILE_PATH[@]} -eq 0 ]; then
    echo "Usage: $0 -a <account-name> -c <container-name> -f <file-path> [-b <blob_name>]"
    exit 1
fi

if [ ! -f "$FILE_PATH" ]; then
    echo "File not found: $FILE_PATH"
    exit 1
fi

BLOB_NAME=${BLOB_NAME:-$(basename $FILE_PATH)}

az storage blob upload --account-name $ACCOUNT_NAME --container-name $CONTAINER_NAME --name $BLOB_NAME --file $FILE_PATH --auth-mode login

if [ $? -eq 0 ]; then
    echo "File uploaded successfully."
else
    echo "File upload failed."
fi