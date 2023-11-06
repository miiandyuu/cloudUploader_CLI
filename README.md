# Azure Blob Storage Upload Tool

## Overview
This is a bash-based CLI tool that allows users to upload files to Azure Blob Storage. It provides a simple and seamless upload experience, similar to popular storage services. You can upload one or more files to a specified Azure Blob Storage container with this tool.

## Prerequisites
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and authenticated (run 'az login').
- A valid Azure Blob Storage account and container should be set up.

## Installation
1. Clone this repository or download the script.
2. Navigate to the repository directory.
3. Run the installation script as follows:

   ```bash
   sudo ./install.sh
   ```

## Usage
To use the Azure Cloud Uploader CLI, follow the syntax below:

```bash
./azureuploader.sh -a <account-name> -c <container-name> -f <file-path>
```

- `-a <account-name>`: Your Azure storage account name.
- `-c <container-name>`: The name of the Azure Blob Storage container.
- `-f <file-name>`: File path to upload. You can specify multiple -f options to upload multiple files.

### Example:
Upload a single file:
```bash
./azureuploader.sh -a myaccount -c mycontainer -f "file.txt"
```

Upload multiple files:
```bash
./azureuploader.sh -a myaccount -c mycontainer -f "file1.txt" -f "file2.txt"
```