# Script Tải Phần Mềm Tự Động

## Giới thiệu
Dự án này cung cấp một script batch (`download_tools.bat`) giúp bạn tải nhanh nhiều phần mềm phổ biến về máy tính Windows chỉ với vài thao tác đơn giản. Danh sách phần mềm được quản lý trong file `download_list.json`, dễ dàng thêm/xóa/chỉnh sửa.

## Các file chính
- **download_tools.bat**: Script batch chạy trên Windows, cho phép chọn và tải phần mềm tự động.
- **download_list.json**: Danh sách các phần mềm có thể tải, định dạng JSON, mỗi phần tử gồm tên, link tải và tên file lưu.

## Hướng dẫn sử dụng
### 1. Chuẩn bị
- Đảm bảo bạn đang sử dụng Windows và có sẵn PowerShell.
- Đặt cả hai file `download_tools.bat` và `download_list.json` trong cùng một thư mục.

### 2. Chạy script
- Nhấp đúp vào file `download_tools.bat` hoặc chuột phải chọn "Run as administrator" để bắt đầu.
- Nhập đường dẫn thư mục nơi bạn muốn lưu các file tải về (ví dụ: `D:\Downloads`). Nếu thư mục chưa tồn tại, script sẽ tự động tạo.

### 3. Chọn phần mềm cần tải
- Script sẽ hiển thị danh sách các phần mềm có trong `download_list.json` dạng số thứ tự:
  ```
  [1] Google Chrome
  [2] VSCode
  [3] 7zip
  ...
  ```
- Nhập số thứ tự các phần mềm muốn tải, cách nhau bằng dấu phẩy (ví dụ: `1,3,5`).
- Script sẽ tự động tải các phần mềm đã chọn về thư mục bạn đã nhập.

### 4. Kết quả
- Sau khi tải xong, các file cài đặt sẽ nằm trong thư mục bạn chọn.
- Nếu không chọn phần mềm nào, script sẽ thoát.

## Thêm phần mềm mới vào danh sách
1. Mở file `download_list.json` bằng Notepad hoặc trình soạn thảo bất kỳ.
2. Thêm một đối tượng mới vào mảng, ví dụ:
   ```json
   {
     "name": "Tên phần mềm",
     "url": "Link tải trực tiếp",
     "output": "Tên file lưu"
   }
   ```
3. Đảm bảo các phần tử cách nhau bằng dấu phẩy, file hợp lệ dạng JSON.

### Ví dụ thêm phần mềm mới
```json
[
  ...
  {
    "name": "Firefox",
    "url": "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=vi",
    "output": "firefox_installer.exe"
  }
]
```

## Lưu ý
- Script chỉ hoạt động trên Windows.
- Đảm bảo link tải là link trực tiếp tới file cài đặt.
- Không xóa hoặc đổi tên các trường trong file JSON.

## Liên hệ
Nếu gặp lỗi hoặc cần hỗ trợ, vui lòng liên hệ quản trị viên dự án.

## Hướng dẫn tải repo và chạy script trên máy tính Windows mới (không cần trình duyệt)

Nếu máy tính của bạn vừa cài lại Windows, chưa có trình duyệt hoặc công cụ nào, hãy làm theo các bước sau để tải toàn bộ repo này và chạy script hoàn toàn bằng dòng lệnh:

### 1. Mở PowerShell (Run as Administrator)
- Nhấn tổ hợp phím `Windows + R`, nhập `powershell`, nhấn `Ctrl + Shift + Enter` để chạy với quyền admin.

### 2. Tải file zip của repo từ GitHub về máy
Chạy lệnh sau trong PowerShell:

```
Invoke-WebRequest -Uri "https://github.com/nht2312/script-download-app/archive/refs/heads/main.zip" -OutFile "script-download-app.zip"
```

### 3. Giải nén file zip

```
Expand-Archive -Path "script-download-app.zip" -DestinationPath "."
```

### 4. Đổi tên thư mục (nếu cần)

```
Rename-Item -Path ".\script-download-app-main" -NewName "script-download-app"
```

### 5. Chạy script tải phần mềm

```
cd .\script-download-app
.\download_tools.bat
```

Sau đó làm theo hướng dẫn trên màn hình để chọn phần mềm cần tải.

**Lưu ý:**
- Các lệnh trên đều sử dụng PowerShell mặc định của Windows, không cần cài thêm gì.
- Nếu gặp cảnh báo về chính sách thực thi script, hãy chạy lệnh sau trước khi chạy file batch:

```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```