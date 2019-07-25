FROM ubuntu

RUN apt-get update

RUN apt-get install -y wget

RUN wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb

RUN apt-get install -y apt-transport-https
RUN apt-get update
RUN apt-get install -y dotnet-sdk-2.2

WORKDIR /app

COPY ./publish .

ENTRYPOINT ["dotnet", "website.dll"]
