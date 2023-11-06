# Azure Blob Storage Upload Tool

## Overview
This is a bash-based CLI tool that allows users to upload files to Azure Blob Storage. It provides a simple and seamless upload experience, similar to popular storage services. You can specify the Azure storage account, container, file path, and optional blob name.

## Prerequisites
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and authenticated (run 'az login').

## Installation
1. Clone this repository or download the script.
2. Navigate to the repository directory.
3. Run the installation script as follows:
   ```bash
   sudo ./install.sh
   ```

## Usage
The tool accepts the following command-line options:

- '-a <account-name>': Your Azure storage account name.
- '-c <container-name>': The name of the Azure Blob Storage container.
- '-f <file-path>': The path to the local file you want to upload.
- '-b <blob-name>' (optional): The name for the blob in Azure Blob Storage. If not provided, it defaults to the local file's name.

### Example:
```bash
./azure_upload.sh -a myaccount -c mycontainer -f /path/to/file.txt -b myblob.txt
```