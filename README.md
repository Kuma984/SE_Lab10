# SE Lab 10: Software Deployment

Course: Software Engineering (FIT - TDTU)  
Instructor: Mr. Ky-Trung Pham (tg_phamthaikytrung@tdtu.edu.vn)  
Student: Trịnh Đức Long (524K0021)  
GitHub Repository: https://github.com/Kuma984/SE_Lab10.git  
Docker Hub Image: https://hub.docker.com/r/kuma984/myaspnetcoreapp  

---

## 1. Yêu cầu môi trường
- .NET SDK 8.0 trở lên
- Visual Studio 2022
- Docker Desktop (cho Windows 10/11)

---

## 2. Cấu trúc dự án
Solution: `SE_Lab10_524K0021.sln`
- `src/myaspnetcoreapp`: Ứng dụng web ASP.NET Core MVC kèm Dashboard hiển thị thông tin sinh viên, môi trường runtime và container host.
- `Dockerfile`: Cấu hình multi-stage build tối ưu kích thước image runtime.
- `docker-compose.yml`: Cấu hình chạy ứng dụng tự động trên cổng 8080:8080.
- `.github/workflows/docker-image.yml`: Pipeline CI/CD tự động build và push image lên Docker Hub khi có commit mới.

---

## 3. Hướng dẫn chạy

### Cách 1: Chạy trực tiếp trên máy bằng Visual Studio (Local / F5)
1. Mở file `SE_Lab10_524K0021.sln` bằng Visual Studio 2022.
2. Nhấn **F5** (hoặc nút Run màu xanh).
3. Visual Studio sẽ tự động build và mở trình duyệt web tại địa chỉ:
   `http://localhost:8080` (hoặc `http://localhost:5227`)
   để xem giao diện web ứng dụng.

Hoặc chạy nhanh bằng dòng lệnh:
```powershell
dotnet run --project src/myaspnetcoreapp
```

---

### Cách 2: Chạy bằng Docker (Khuyên dùng cho Lab 10)
> *Lưu ý:* Cần bật Docker Desktop trước khi chạy các lệnh bên dưới.

#### Lựa chọn A: Dùng Docker Compose (Đơn giản nhất - 1 lệnh)
Mở terminal tại thư mục bài làm:
```powershell
# 1. Khởi động container ở chế độ background
docker compose up -d

# 2. Mở trình duyệt web truy cập:
# http://localhost:8080

# 3. Xem log chạy của container:
docker logs -f myaspnetcoreappcontainer

# 4. Khi muốn dừng container:
docker compose down
```

#### Lựa chọn B: Dùng lệnh Docker CLI thủ công
```powershell
# 1. Build Docker image
docker build -t myaspnetcoreapp:latest .

# 2. Chạy container ở chế độ detached, map cổng 8080
docker run -d -p 8080:8080 --name myapp myaspnetcoreapp:latest

# 3. Kiểm tra trạng thái container
docker ps

# 4. Dừng và xóa container sau khi kiểm tra xong
docker stop myapp
docker rm myapp
```
