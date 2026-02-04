# 🚀 Quick Start: Install GCC Compiler

**เวลาที่ใช้:** 5-10 นาที  
**ขนาด Download:** ~80 MB

---

## 📥 One-Click Installation (แนะนำ)

### Windows PowerShell

1. **เปิด PowerShell as Administrator** (คลิกขวา → Run as Administrator)

2. **รัน command เดียว:**

```powershell
# Download and run installation script
Set-ExecutionPolicy Bypass -Scope Process -Force; irm https://raw.githubusercontent.com/koson/C_Language_Tutorials/main/00-setup/install-gcc.ps1 | iex
```

**หรือ Download แล้วรันเอง:**

```powershell
# Download script
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/koson/C_Language_Tutorials/main/00-setup/install-gcc.ps1" -OutFile "install-gcc.ps1"

# Run
Set-ExecutionPolicy Bypass -Scope Process -Force; .\install-gcc.ps1
```

3. **Script จะทำอัตโนมัติ:**
   - ✅ ติดตั้ง 7-Zip (ถ้ายังไม่มี)
   - ✅ Download MinGW-w64 (GCC 13.2.0)
   - ✅ Extract ไปที่ C:\mingw64
   - ✅ เพิ่มเข้า System PATH
   - ✅ Verify การติดตั้ง

---

## ✅ Verify Installation

หลังติดตั้งเสร็จ:

1. **เปิด PowerShell หรือ Command Prompt ใหม่**
2. **ทดสอบ:**

```powershell
gcc --version
```

**Output ที่ถูกต้อง:**
```
gcc (GCC) 13.2.0
Copyright (C) 2023 Free Software Foundation, Inc.
```

---

## 🎯 Test Your First Program

1. **สร้างไฟล์ hello.c:**

```c
#include <stdio.h>

int main() {
    printf("Hello, C Programming!\n");
    return 0;
}
```

2. **Compile:**

```powershell
gcc hello.c -o hello
```

3. **Run:**

```powershell
.\hello.exe
```

**Output:**
```
Hello, C Programming!
```

---

## 🔧 What Gets Installed?

| Component | Location | Description |
|-----------|----------|-------------|
| **GCC** | C:\mingw64\bin\gcc.exe | C Compiler |
| **G++** | C:\mingw64\bin\g++.exe | C++ Compiler |
| **GDB** | C:\mingw64\bin\gdb.exe | Debugger |
| **Make** | C:\mingw64\bin\make.exe | Build Tool |
| **7-Zip** | C:\Program Files\7-Zip\ | Archive Tool |

**Total Size:** ~600 MB (installed)

---

## 💡 Troubleshooting

### ❌ Problem: `gcc: command not found`

**Solution:**
1. Close and reopen your terminal
2. Check PATH:
   ```powershell
   $env:Path -split ";" | Select-String "mingw64"
   ```
3. If missing, add manually:
   - Windows + S → "Environment Variables"
   - System Properties → Environment Variables
   - Path → Edit → New → `C:\mingw64\bin`

### ❌ Problem: Script Execution Policy Error

**Solution:**
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

### ❌ Problem: Download Failed

**Solution:**
- Check internet connection
- Try manual download: [MinGW-w64 Releases](https://github.com/niXman/mingw-builds-binaries/releases)
- Follow manual installation in main README

---

## 🎓 Next Steps

หลังติดตั้งเสร็จ:

1. **เริ่มเขียนโค้ด C** → ทดสอบ program แรก
2. **ศึกษา compilation process** → เข้าใจการทำงาน
3. **ติดตั้ง VS Code** → พร้อมสำหรับเขียนโค้ด

---

## ⚙️ Advanced: Custom Installation

```powershell
# Install to custom location
$env:MINGW_INSTALL_DIR = "D:\Tools\mingw64"
.\install-gcc.ps1
```

---

## 🆘 Need Help?

- **Issues:** [GitHub Issues](https://github.com/koson/C_Language_Tutorials/issues)
- **YouTube Comments:** Ask questions in video comments
- **Repository:** https://github.com/koson/C_Language_Tutorials

---

**Happy Coding! 🚀**
