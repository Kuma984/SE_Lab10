# Lab 10 - Software Deployment

## Yêu cầu môi trường
- .NET SDK 8.0
- Visual Studio 2022
- Docker Desktop

## Hướng dẫn chạy

### 1. Chạy Local (Visual Studio)
- Mở file `SE_Lab10_524K0021.sln`.
- Nhấn **F5** để build và chạy ứng dụng web.
- Trình duyệt sẽ tự động mở trang web tại địa chỉ `http://localhost:8080`.

Hoặc chạy nhanh bằng dòng lệnh:
```bash
dotnet run --project src/myaspnetcoreapp
```

---

### 2. Chạy bằng Docker Compose (Khuyên dùng)
Đảm bảo Docker Desktop đang mở trước khi chạy:

```bash
# Khởi động container chạy ngầm
docker compose up -d

# Truy cập trình duyệt tại: http://localhost:8080

# Xem log container:
docker logs -f myaspnetcoreappcontainer

# Dừng container:
docker compose down
```

---

### 3. Chạy bằng lệnh Docker CLI
```bash
# Build image
docker build -t myaspnetcoreapp:latest .

# Chạy container trên cổng 8080
docker run -d -p 8080:8080 --name myapp myaspnetcoreapp:latest

# Kiểm tra container đang chạy
docker ps

# Dừng và xóa container sau khi dùng xong
docker stop myapp
docker rm myapp
```
