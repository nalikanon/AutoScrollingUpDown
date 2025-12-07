#!/bin/bash

# Script สำหรับตั้งค่า Virtual Environment และติดตั้ง dependencies

echo "🚀 กำลังตั้งค่า Auto Scrolling TikTok..."
echo ""

# ตรวจสอบว่ามี Python 3 หรือไม่
if ! command -v python3 &> /dev/null; then
    echo "❌ ไม่พบ Python 3 กรุณาติดตั้ง Python 3 ก่อน"
    exit 1
fi

echo "✅ พบ Python 3: $(python3 --version)"
echo ""

# สร้าง virtual environment
echo "📦 กำลังสร้าง Virtual Environment..."
python3 -m venv venv

# ตรวจสอบว่าสร้างสำเร็จหรือไม่
if [ ! -d "venv" ]; then
    echo "❌ ไม่สามารถสร้าง Virtual Environment ได้"
    exit 1
fi

echo "✅ สร้าง Virtual Environment สำเร็จ"
echo ""

# เปิดใช้งาน virtual environment และติดตั้ง dependencies
echo "📥 กำลังติดตั้ง dependencies..."
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

echo ""
echo "✅ ติดตั้ง dependencies สำเร็จ!"
echo ""
echo "=================================================="
echo "📝 วิธีใช้งาน:"
echo "=================================================="
echo ""
echo "1. เปิดใช้งาน Virtual Environment:"
echo "   source venv/bin/activate"
echo ""
echo "2. รันสคริปต์:"
echo "   python auto_scroll_tiktok.py"
echo ""
echo "3. เมื่อใช้งานเสร็จ ปิดใช้งาน Virtual Environment:"
echo "   deactivate"
echo ""
echo "=================================================="

