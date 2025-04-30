@echo off
setlocal enabledelayedexpansion

:: Hỏi người dùng nhập thư mục lưu file
set /p folder=Nhập đường dẫn thư mục để lưu file tải về: 

if not exist "%folder%" (
    echo Thư mục không tồn tại. Đang tạo thư mục...
    mkdir "%folder%"
)

cd /d "%folder%"

:: Hiển thị danh sách phần mềm từ file JSON và cho phép chọn
powershell -NoProfile -Command "\
  $list = Get-Content download_list.json | Out-String | ConvertFrom-Json;\
  $i = 1;\
  foreach ($item in $list) {\
    Write-Host \"[$i] $($item.name)\"; $i++\
  };\
  Write-Host '';\
  $choice = Read-Host 'Nhập số thứ tự các phần mềm muốn tải (cách nhau bằng dấu phẩy, ví dụ: 1,3,5):';\
  $indexes = $choice -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ -match '^[0-9]+$' };\
  $selected = @();\
  foreach ($idx in $indexes) {\
    if (($idx -as [int]) -ge 1 -and ($idx -as [int]) -le $list.Count) { $selected += $list[$idx-1] }\
  };\
  if ($selected.Count -eq 0) { Write-Host 'Không có phần mềm nào được chọn. Thoát.'; exit }\
  $selected | ForEach-Object {\
    Write-Host \"Đang tải $($_.name)...\";\
    Invoke-WebRequest -Uri $_.url -OutFile $_.output\
  }\
  Write-Host 'Hoàn tất tải về!';\
  pause\
"