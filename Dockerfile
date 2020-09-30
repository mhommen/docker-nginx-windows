FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ARG NgInxVersion="1.19.2"
ENV NgInxZipUrl="http://nginx.org/download/nginx-${NgInxVersion}.zip"

RUN Invoke-WebRequest -Uri $env:NgInxZipUrl -UseBasicParsing -Outfile c:\\nginx.zip
RUN Expand-Archive -Path c:\\nginx.zip -DestinationPath c:\\nginx

WORKDIR "c:\\nginx\\nginx-${NgInxVersion}"

#COPY ./nginx.conf conf\\nginx.conf

ENTRYPOINT powershell .\\nginx.exe