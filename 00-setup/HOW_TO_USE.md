# 📝 How to Use the Installation Script

สำหรับผู้ชมที่ต้องการติดตั้ง GCC อัตโนมัติ

---

## 🎯 สำหรับผู้ชม YouTube

### วิธีที่ 1: ใช้ Script อัตโนมัติ (แนะนำ) ⭐

1. **Download script:**
   - ไปที่: https://github.com/koson/C_Language_Tutorials
   - Download `install-gcc.ps1` (อยู่ใน folder `00-setup/`)

2. **เปิด PowerShell as Administrator:**
   - กด Windows + X
   - เลือก "Windows PowerShell (Admin)" หรือ "Terminal (Admin)"

3. **ไปที่ folder ที่ download:**
   ```powershell
   cd Downloads
   ```

4. **รัน script:**
   ```powershell
   .\install-gcc.ps1
   ```

5. **รอ 5-10 นาที** → เสร็จ! ✅

---

### วิธีที่ 2: รันตรงจาก GitHub (เร็วสุด) 🚀

**One command - ไม่ต้อง download:**

```powershell
# เปิด PowerShell as Administrator แล้วรัน:
Set-ExecutionPolicy Bypass -Scope Process -Force; irm https://raw.githubusercontent.com/koson/C_Language_Tutorials/main/00-setup/install-gcc.ps1 | iex
```

---

### วิธีที่ 3: Manual Installation (ถ้า script ไม่ work)

ดู [QUICKSTART.md](./QUICKSTART.md) สำหรับขั้นตอนแบบละเอียด

---

## ✅ ตรวจสอบว่าติดตั้งสำเร็จ

เปิด PowerShell หรือ CMD ใหม่:

```powershell
gcc --version
```

ถ้าเห็น:
```
gcc (GCC) 13.2.0
...
```

**= สำเร็จ!** 🎉

---

## 🎬 สำหรับ Recording (คนทำคลิป)

Script จะแสดง progress แบบสวยงาม:

```
╔═══════════════════════════════════════════════════════════════════════╗
║           GCC (MinGW-w64) Automatic Installation Script              ║
║           For C Programming Development on Windows                   ║
╚═══════════════════════════════════════════════════════════════════════╝

📋 STEP 1: Checking existing GCC installation...
✅ Ready to install GCC

📦 STEP 2: Installing 7-Zip...
✅ 7-Zip installed successfully!

📥 STEP 3: Downloading MinGW-w64 (GCC 13.2.0)...
⏳ This may take a few minutes (80+ MB)...
✅ Download complete! (82.05 MB)

📦 STEP 4: Extracting MinGW-w64 to C:\mingw64...
⏳ This may take a few minutes...
✅ Extraction complete!
✅ GCC compiler found at C:\mingw64\bin\gcc.exe

🔧 STEP 5: Adding GCC to System PATH...
✅ C:\mingw64\bin added to System PATH

✅ STEP 6: Verifying Installation...
🧪 Testing GCC:
   gcc.exe (x86_64-posix-seh-rev1, Built by MinGW-Builds project) 13.2.0
🧪 Testing G++:
   g++.exe (x86_64-posix-seh-rev1, Built by MinGW-Builds project) 13.2.0
🧪 Testing compilation:
   GCC is working correctly!

╔═══════════════════════════════════════════════════════════════════════╗
║                   ✅ INSTALLATION COMPLETE!                           ║
╚═══════════════════════════════════════════════════════════════════════╝
```

---

## 🔍 What the Script Does

1. ✅ Checks if GCC already installed
2. ✅ Installs 7-Zip (via winget)
3. ✅ Downloads MinGW-w64 from GitHub
4. ✅ Extracts to C:\mingw64
5. ✅ Adds to System PATH automatically
6. ✅ Verifies installation with test compilation

**Total time:** 5-10 minutes  
**Requires:** Administrator privileges, Internet connection

---

## 🛡️ Safety & Security

- ✅ Official MinGW-w64 from GitHub releases
- ✅ Uses official winget package manager
- ✅ No third-party installers
- ✅ Open source script (audit anytime)
- ✅ Backup existing installation before overwriting

---

## 🧹 Uninstall

```powershell
# Remove directory
Remove-Item -Path "C:\mingw64" -Recurse -Force

# Remove from PATH manually:
# Windows + S → "Environment Variables"
# System Properties → Environment Variables
# Edit PATH → Remove "C:\mingw64\bin"
```

---

## 💡 Tips for Students

1. **ใช้ script นี้** ถ้าคุณ:
   - ไม่เคยติดตั้ง compiler มาก่อน
   - ต้องการความง่าย
   - ไม่แน่ใจขั้นตอน manual

2. **ติดตั้ง manual** ถ้าคุณ:
   - ต้องการควบคุมทุกขั้นตอน
   - มีปัญหากับ script
   - ต้องการเรียนรู้ process

3. **หลังติดตั้ง:**
   - ต้อง restart terminal เพื่อให้ PATH อัพเดต
   - ทดสอบด้วย `gcc --version`
   - ถ้ามีปัญหา: ดู Troubleshooting

---

## 📞 Support

ถ้ามีปัญหา:

1. **ดู [QUICKSTART.md](./QUICKSTART.md)** - Troubleshooting
2. **GitHub Issues** - Report bugs: https://github.com/koson/C_Language_Tutorials/issues
3. **YouTube Comments** - Ask questions

---

**Made with ❤️ for C Programming students**
