# Lab 10 - Software Deployment

## Requirements
- .NET 8.0 SDK
- Visual Studio 2022
- Docker Desktop

## How to Run

### 1. Local (Visual Studio)
1. Open `SE_Lab10_524K0021.sln`.
2. Press **F5** to build and run the ASP.NET Core MVC application.
3. The browser will open automatically at `http://localhost:8080`.

Or run via command line:
```bash
dotnet run --project src/myaspnetcoreapp
```

---

### 2. Docker Compose (Recommended)
Make sure Docker Desktop is running before executing:

```bash
# Start container in background
docker compose up -d

# Open browser at: http://localhost:8080

# View container logs
docker logs -f myaspnetcoreappcontainer

# Stop container
docker compose down
```

---

### 3. Docker CLI
```bash
# Build Docker image
docker build -t myaspnetcoreapp:latest .

# Run container on port 8080
docker run -d -p 8080:8080 --name myapp myaspnetcoreapp:latest

# Check running status
docker ps

# Stop and remove container
docker stop myapp
docker rm myapp
```
