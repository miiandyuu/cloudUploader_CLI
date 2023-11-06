@echo off

az account show 2>nul
if errorlevel 1 (
    echo Azure CLI is not aunthenticated. Use 'az login' to aunthenticated.
    exit /b 1
)

if "%~1" == "--file-name" (
    set "file_name=%~2"
    echo File name: %file_name%
) else (
    echo Missing or invalid arguments. Usage: azureuploader.cmd --file-name <file_name>
)

set FILE_PATH=%~1

if not exist "%FILE_PATH" (
    echo File not found: %FILE_PATH%
    exit /b 1
)

set ACCOUNT_NAME=projects2023
set CONTAINER_NAME=clouduploader
for /f "delims=" %%a in ("%FILE_PATH%") do set BLOB_NAME=%%~nxa

az storage blob upload --type block --account-name %STORAGE_ACCOUNT% --type block --name %BLOB_NAME% --type block %FILE_PATH%

if errorlevel 1 (
    echo Error upload the file to Azure Blob Storage
) else (
    echo File uploaded successfully to Azure Blob Storage
)