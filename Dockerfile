FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR webapp

EXPOSE 80
EXPOSE 5000

COPY ./*.csproj ./
RUN dotnet restore

COPY . .
RUN dotnet publish -c realease -o -out

#build image
FROM mcr.microsoft.com/dotnet/sdk:6.0
WORKDIR /webapp
COPY --from=build /webapp/out .
ENTRYPOINT ["dotnet", "dockerDoNetApp.dll"]
