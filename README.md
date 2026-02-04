# 🎓 C Programming Tutorials - Resources for Viewers

**คอร์สเรียน C Programming สำหรับผู้เริ่มต้น**  
**Repository นี้เป็นแหล่งรวม code, scripts, และเอกสารประกอบสำหรับผู้ชม YouTube**

---

## 🎯 เกี่ยวกับ Repository นี้

Repository นี้จัดทำขึ้นเพื่อเป็นแหล่งสำหรับ:
- 📥 **Download scripts** สำหรับติดตั้ง GCC compiler
- 💻 **Code examples** ที่ใช้ในคลิปสอน
- 📚 **คู่มือการใช้งาน** และ troubleshooting guides
- 🔧 **Tools และ utilities** ที่จำเป็นสำหรับการเรียน C

---

## 🚀 Quick Start

### ติดตั้ง GCC Compiler (Windows)

**วิธีที่เร็วที่สุด - One Command:**

```powershell
# เปิด PowerShell as Administrator แล้วรัน:
Set-ExecutionPolicy Bypass -Scope Process -Force; irm https://raw.githubusercontent.com/koson/C_Language_Tutorials/main/00-setup/install-gcc.ps1 | iex
```

**หรือ Download script มาก่อน:**

1. Download [install-gcc.ps1](./00-setup/install-gcc.ps1)
2. เปิด PowerShell as Administrator
3. รัน: `.\install-gcc.ps1`

**คู่มือเพิ่มเติม:**
- 📖 [HOW_TO_USE.md](./00-setup/HOW_TO_USE.md) - คู่มือการใช้งาน script
- 🚀 [QUICKSTART.md](./00-setup/QUICKSTART.md) - เริ่มต้นอย่างรวดเร็ว

---

## 📁 โครงสร้าง Repository

```
C_Language_Tutorials/
├── 00-setup/
│   ├── install-gcc.ps1      # Script ติดตั้ง GCC อัตโนมัติ
│   ├── HOW_TO_USE.md        # คู่มือการใช้งาน
│   └── QUICKSTART.md        # เริ่มต้นอย่างรวดเร็ว
│
├── code-examples/           # Code ตัวอย่างจากคลิป (เร็วๆ นี้)
│
└── README.md                # ไฟล์นี้
```

---

## 🎬 สำหรับผู้ชม YouTube

### คุณจะได้อะไรจาก Repository นี้?

✅ **Scripts ที่ใช้งานง่าย** - ติดตั้ง GCC แค่คำสั่งเดียว  
✅ **Code ตัวอย่างครบถ้วน** - ทุก code ที่ใช้ในคลิป  
✅ **คู่มือภาษาไทย** - อธิบายละเอียด ง่ายต่อการทำตาม  
✅ **Support & Troubleshooting** - แก้ปัญหาที่พบบ่อย

### วิธีใช้งาน

1. **ดูคลิปใน YouTube** → เรียนรู้เนื้อหา
2. **Download code จาก repo นี้** → ทดลองเขียน
3. **ใช้ scripts ที่มีให้** → ติดตั้ง tools
4. **ถามคำถามใน Issues** → ได้รับความช่วยเหลือ

---

## 📚 เนื้อหาหลักสูตร

### 🟢 Episode 00: Setup & Installation
- ติดตั้ง GCC Compiler
- ตั้งค่า Development Environment
- เขียนโปรแกรมแรก

### 🔵 Beginner Series (เร็วๆ นี้)
- Basic Syntax & Variables
- Control Flow (if/else, loops)
- Functions & Arrays
- Strings

### 🟡 Intermediate Series (เร็วๆ นี้)
- Pointers & Memory
- Structures & File I/O
- Advanced Topics

### 🔴 Advanced & Projects (เร็วๆ นี้)
- Data Structures
- Algorithms
- Real-world Projects

---

## 🔧 ความต้องการของระบบ

### สำหรับ Windows:
- **OS:** Windows 10/11 (64-bit)
- **RAM:** 4 GB ขึ้นไป
- **Disk Space:** ~1 GB (สำหรับ GCC และ tools)
- **PowerShell:** Version 5.1 ขึ้นไป

### สำหรับ macOS/Linux:
- GCC มักติดตั้งมาให้แล้ว
- หรือใช้ package manager (`brew`, `apt`, `yum`)

---

## 💡 วิธีตรวจสอบว่าติดตั้ง GCC สำเร็จ

เปิด Terminal/PowerShell แล้วรัน:

```bash
gcc --version
```

ถ้าเห็นข้อความแบบนี้ = **สำเร็จ!** 🎉

```
gcc (GCC) 13.2.0
Copyright (C) 2023 Free Software Foundation, Inc.
```

---

## 🆘 ขอความช่วยเหลือ

หากประสบปัญหา:

1. **ตรวจสอบ [QUICKSTART.md](./00-setup/QUICKSTART.md)** → มี Troubleshooting section
2. **เปิด GitHub Issue** → https://github.com/koson/C_Language_Tutorials/issues
3. **ถามในคอมเมนต์ YouTube** → ตอบในคลิป
4. **ดูคู่มือเพิ่มเติม** → [HOW_TO_USE.md](./00-setup/HOW_TO_USE.md)

---

## 🎥 ช่อง YouTube

🔗 **[ชื่อช่อง YouTube]** ← Subscribe เพื่อติดตามคลิปใหม่!

---

## 📝 License

Repository นี้เป็น Open Source สำหรับการศึกษา  
คุณสามารถ download, แก้ไข, และแชร์ได้อย่างอิสระ

---

## 🙏 ขอบคุณ

ขอบคุณทุกท่านที่ติดตาม support และเรียนรู้ไปด้วยกัน!  
หวังว่า repository นี้จะเป็นประโยชน์สำหรับการเริ่มต้น C Programming

**Happy Coding! 🚀**

---

## 🔖 Tags

`#C` `#Programming` `#Tutorial` `#Beginner` `#GCC` `#Windows` `#Thai` `#ภาษาไทย`

---

**Repository URL:** https://github.com/koson/C_Language_Tutorials  
**Last Updated:** February 2026