# Base stage for runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080

# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["src/myaspnetcoreapp/myaspnetcoreapp.csproj", "src/myaspnetcoreapp/"]
RUN dotnet restore "src/myaspnetcoreapp/myaspnetcoreapp.csproj"
COPY src/myaspnetcoreapp/ src/myaspnetcoreapp/
WORKDIR "/src/src/myaspnetcoreapp"
RUN dotnet build "myaspnetcoreapp.csproj" -c Release -o /app/build

# Publish stage
FROM build AS publish
RUN dotnet publish "myaspnetcoreapp.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Final production runtime stage
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "myaspnetcoreapp.dll"]
