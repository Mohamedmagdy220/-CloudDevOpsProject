# استخدام صورة Python الأساس
FROM python:3.8-slim

# تعيين مجلد العمل داخل الـ container
WORKDIR /app

# نسخ ملف المتطلبات (requirements) إلى الـ container
COPY requirements.txt .

# تثبيت المكتبات المطلوبة
RUN pip install --no-cache-dir -r requirements.txt

# نسخ باقي ملفات التطبيق إلى الـ container
COPY . .

# فتح البورت 5000
EXPOSE 5000

# تشغيل التطبيق
CMD ["python", "app.py"]
