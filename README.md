# Auto Scrolling TikTok

สคริปต์สำหรับเลื่อน TikTok ขึ้นลงอัตโนมัติทีละ 1 ครั้งแล้ววนลูปต่อเนื่อง

## การติดตั้ง

### วิธีที่ 1: ใช้สคริปต์อัตโนมัติ (แนะนำ)

รันสคริปต์ setup เพื่อสร้าง virtual environment และติดตั้ง dependencies อัตโนมัติ:

```bash
chmod +x setup.sh
./setup.sh
```

### วิธีที่ 2: ติดตั้งด้วยตนเอง

1. ติดตั้ง Python 3.6 หรือสูงกว่า

2. สร้าง Virtual Environment:
```bash
python3 -m venv venv
```

3. เปิดใช้งาน Virtual Environment:
```bash
source venv/bin/activate
```

4. ติดตั้ง dependencies:
```bash
pip install -r requirements.txt
```

**หมายเหตุ**: บน macOS อาจเจอ error `externally-managed-environment` ถ้าใช้ `pip3` โดยตรง ควรใช้ virtual environment แทน

## วิธีใช้งาน

1. **เปิดใช้งาน Virtual Environment** (ถ้ายังไม่ได้เปิด):
```bash
source venv/bin/activate
```

2. เปิด TikTok ในเบราว์เซอร์หรือแอปพลิเคชัน
3. วางหน้าจอให้อยู่ในตำแหน่งที่ต้องการ
4. รันสคริปต์:
```bash
python auto_scroll_tiktok.py
```

5. สคริปต์จะเริ่มทำงานหลังจากนับถอยหลัง 3 วินาที

6. เมื่อใช้งานเสร็จ **ปิดใช้งาน Virtual Environment**:
```bash
deactivate
```

## การหยุดการทำงาน

- **วิธีที่ 1**: กด `Ctrl+C` ใน terminal
- **วิธีที่ 2**: เลื่อนเมาส์ไปที่มุมบนขวาของหน้าจอ (FailSafe)

## การปรับแต่ง

แก้ไขค่าต่างๆ ในไฟล์ `auto_scroll_tiktok.py`:

- `SCROLL_DELAY`: หน่วงเวลาระหว่างการเลื่อนแต่ละครั้ง (วินาที)
- `LOOP_DELAY`: หน่วงเวลาระหว่างลูป (วินาที)
- `SCROLL_AMOUNT`: จำนวนครั้งในการเลื่อน (1 = เลื่อน 1 ครั้ง)

## หมายเหตุ

- ต้องให้สคริปต์มีสิทธิ์ในการควบคุมเมาส์และคีย์บอร์ด
- บน macOS อาจต้องให้สิทธิ์ Accessibility ใน System Preferences
- ตรวจสอบให้แน่ใจว่า TikTok อยู่ในโฟกัสก่อนเริ่มสคริปต์

