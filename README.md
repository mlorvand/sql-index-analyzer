# sql-index-analyzer
Script for analyzing SQL Server index structure and filegroup usage
# 🔍 SQL Server Index Insight Script

## 🇬🇧 English

This SQL script provides a detailed view of index allocation, filegroup usage, and physical storage for user tables in any SQL Server database. It's a valuable tool for DBAs and data engineers aiming to analyze storage consumption and index types per table.

### 🧠 Key Features
- Filegroup type and file path
- Total/used/data space (in KB)
- Index types (heap, clustered, nonclustered, etc.)
- Schema & table structure overview

> 💡 Only includes user tables (`USER_TABLE`) and filegroups of type 'FD' or index type 0 (Heap).

---

## 🇮🇷 فارسی

این اسکریپت SQL نمایی کامل از وضعیت ایندکس‌ها، فایل‌گروپ‌ها و فضای فیزیکی مصرف‌شده برای جداول کاربری دیتابیس فراهم می‌کند. ابزار مناسبی برای DBAها و مهندسین داده برای بررسی نحوه مصرف منابع است.

### 💎 ویژگی‌ها
- نوع فایل‌گروپ و مسیر فایل
- نمایش فضای کلی، استفاده‌شده و فضای دیتا (به KB)
- نوع ایندکس (Heap، Clustered و...)
- ساختار جدول‌ها به همراه نام اسکیمای مربوطه

> 📌 فقط جداول کاربری و فایل‌گروپ‌های نوع خاص را شامل می‌شود.

---

## 🇸🇦 العربية

يوفر هذا السكربت SQL نظرة شاملة على توزيع الفهارس واستخدام مجموعات الملفات والتخزين الفعلي للجداول في قاعدة بيانات SQL Server.

### ✨ الميزات
- نوع مجموعة الملفات والمسار الفيزيائي
- الحجم الكلي والمستخدم وبيانات الصفحات بالكيلوبايت
- أنواع الفهارس (Heap، Clustered، إلخ)
- عرض تفصيلي للمخططات والجداول

> 🛠 يعرض فقط الجداول التي أنشأها المستخدم (`USER_TABLE`) ومجموعات الملفات من نوع معين.

---

## 📎 Sample Output

| FileGroupName | FilePath | TableName | IndexType | DataSizeKB |
|---------------|----------|-----------|-----------|------------|
| PRIMARY       | C:\...   | Customers | Heap      | 123456     |

---

## 🚀 How to Use
Just run the script in **SQL Server Management Studio** on any database. No modifications needed.

---

## 💬 Contact
Made with ❤️ by Mehdi Lorvand
GitHub: https://github.com/mlorvand 
LinkedIn: https://www.linkedin.com/in/mahdi-lorvand-08aa151a4/
