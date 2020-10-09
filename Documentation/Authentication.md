# Authentication

To run the Google Cloud client libraries, you must first set up authentication by creating a service account and setting an environment variable.
The same set of environment variables can be used to authenticate all Google cloud services in use through this package.

Note: You need to set environment variables before starting a MATLAB instance for the environment variables to take effect.

## Getting Service account key:
1. In the [Cloud Console](https://console.cloud.google.com/), navigate to the [Create service account key page](https://console.cloud.google.com/apis/credentials/serviceaccountkey).
2. Select an existing Project or Create a new Project.
3. From the Service account list, select an existing service account or create a new service account.
4. If you have selected a New Service account, key in a name for the Service account name field.
5. From the Role list, select Project > Owner.(Optional: Cloud Admin manages Roles for users. You will need EDITOR role for writing to cloud storage and bigquery tables)

```Click Create. A JSON file that contains your key downloads to your computer.```

## Note:
The Role field authorizes your service account to access resources. If you get permission issues while using the support package within MATLAB, you should look for EDITOR Role access for Service Account within the selected Project.
You can view and change this field later by using the [Cloud Console](https://console.cloud.google.com/). If you are developing a production app, specify more granular permissions than ```Project > Owner```.

For more information, see [granting roles](https://cloud.google.com/iam/docs/granting-roles-to-service-accounts) to service accounts.

## Providing authentication credentials to your MATLAB application:
1. Place downloaded JSON file at a local directory on your system. e.g.```..\Software\MATLAB\config``` of a package
```
{
  "type": "service_account",
  "project_id": "project-123REDACTED45",
  "private_key_id": "1378f5fREDACTED50eb2",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhBZv2fE=\n-----END PRIVATE KEY-----\n",
  "client_email": "467REDACTED5389-compute@developer.gserviceaccount.com",
  "client_id": "115REDACTED7232",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/46REDACTED5389-compute%40developer.gserviceaccount.com"
}
```
2. Rename the json file to a more readable format e.g. credentials.json

3. Add Environment Variable GOOGLE_APPLICATION_CREDENTIALS:

* UNIX:

```
>> export GOOGLE_APPLICATION_CREDENTIALS=../Software/MATLAB/config/credentials.json;
```

* WINDOWS:

  Navigate to ```Advanced System Settings >> Environment Variables```<sup>1</sup> and add new User variable ```GOOGLE_APPLICATION_CREDENTIALS``` with value "/project/location/Software/MATLAB/config/credentials.json"

![environment variable](images/Windows_env_var.png)

 Note: This environment variable only applies to your profile. If you need a less persistent way of setting credentials path, you can do so by setting the variables through shell and starting MATLAB from there.

4. To check whether credentials have been set correctly look for environment variable GOOGLE_APPLICATION_CREDENTIALS as follows
```
getenv("GOOGLE_APPLICATION_CREDENTIALS")

ans =

    '..\..\MATLAB\config\credentials.json'
```

## Usage

Make sure you have followed the steps for [building the SDK](Installation.md) and have run ```/Software/MATLAB/startup.m``` before using individual packages.

## Notes:

<sup>1</sup> Used with permission from Microsoft.

[//]: #  (Copyright 2020 The MathWorks, Inc.)
