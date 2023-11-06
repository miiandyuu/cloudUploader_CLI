#!/bin/bash

# Default values for options
ACCOUNT_NAME=""
CONTAINER_NAME=""
# BLOB_NAME=""
FILE_PATH=()

while getopts ":a:c:f:" opt; do
    case $opt in
        a)
            ACCOUNT_NAME="$OPTARG"
            ;;
        c)
            CONTAINER_NAME="$OPTARG"
            ;;
        # b)
        #     BLOB_NAME="$OPTARG"
        #     ;;
        f)
            FILE_PATH+=("$OPTARG")
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

# Check for Azure CLI authentication
if ! az account show &>/dev/null; then
    echo "Azure CLI is not authenticated. Please run 'az login' to authenticate."
    exit 1
fi

# Check if the required options are provided
if [ -z "$ACCOUNT_NAME" ] || [ -z "$CONTAINER_NAME" ] || [ ${#FILE_PATH[@]} -eq 0 ]; then
    echo "Usage: $0 -a <account-name> -c <container-name> -f <file-path>"
    exit 1
fi

for FILE in "${FILE_PATH[@]}"; do
    #Check if the file exists
    if [ ! -f "$FILE" ]; then
        echo "File not found: $FILE"
        continue
    fi

    # Use the provided BLOB
    BLOB_NAME=$(basename "$FILE")

    # Upload the file to Azure Blob Storage
    az storage blob upload --account-name "$ACCOUNT_NAME" --container-name "$CONTAINER_NAME" --name "$BLOB_NAME" --file "$FILE" --auth-mode login

    # Check for the upload status
    if ! az storage blob upload &>/dev/null; then
        echo "File '$FILE' uploaded successfully as '$BLOB_NAME'."
    else
        echo "Error uploading the file '$FILE'."
    fi
done