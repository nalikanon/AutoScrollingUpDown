# คู่มือการติดตั้งสำหรับ iPhone 11

## ✅ รองรับ iPhone 11

แอปนี้รองรับ **iPhone 11** โดยตรง และตั้งค่าให้ใช้งานได้กับ iOS 13.0 ขึ้นไป

## 📱 ข้อกำหนดสำหรับ iPhone 11

- **iOS Version**: iOS 13.0 หรือสูงกว่า
- **Xcode**: Xcode 14.0 หรือสูงกว่า (บน Mac)
- **Apple Developer Account**: ฟรี (สำหรับการทดสอบบนเครื่องจริง)

## 🚀 วิธีติดตั้งบน iPhone 11

### ขั้นตอนที่ 1: เตรียม Mac

1. ติดตั้ง **Xcode** จาก App Store
2. เปิด Xcode และยอมรับข้อตกลง
3. ไปที่ **Xcode > Settings > Accounts**
4. เพิ่ม Apple ID ของคุณ (ไม่ต้องเป็น Developer Account แบบเสียเงิน)

### ขั้นตอนที่ 2: เชื่อมต่อ iPhone 11

1. ใช้สาย USB เชื่อมต่อ iPhone 11 กับ Mac
2. ปลดล็อก iPhone 11
3. แตะ **"เชื่อถือคอมพิวเตอร์"** บน iPhone (ถ้ามี)

### ขั้นตอนที่ 3: เปิดโปรเจกต์

1. เปิด Xcode
2. เลือก **File > Open**
3. ไปที่โฟลเดอร์ `iOS/AutoScrollTikTok.xcodeproj`
4. เปิดไฟล์

### ขั้นตอนที่ 4: ตั้งค่า Signing

1. ใน Xcode เลือกโปรเจกต์ **AutoScrollTikTok** (ไอคอนสีน้ำเงินด้านซ้าย)
2. เลือก Target **AutoScrollTikTok**
3. ไปที่แท็บ **"Signing & Capabilities"**
4. ติ๊ก **"Automatically manage signing"**
5. เลือก **Team** เป็น Apple ID ของคุณ
6. Xcode จะสร้าง Provisioning Profile อัตโนมัติ

### ขั้นตอนที่ 5: Build และ Run

1. เลือก **iPhone 11** เป็น target device (ด้านบนของ Xcode)
2. กด **⌘R** หรือปุ่ม **Run** (▶️)
3. ถ้าเจอ error เกี่ยวกับ Developer Certificate:
   - ไปที่ **Settings > General > VPN & Device Management** บน iPhone
   - แตะ **Developer App** และกด **"Trust"**

### ขั้นตอนที่ 6: ให้สิทธิ์ Accessibility

1. ไปที่ **Settings > Accessibility** บน iPhone 11
2. เลื่อนลงหา **Auto Scroll TikTok**
3. เปิดใช้งาน **Full Access**

## 🎯 วิธีใช้งานบน iPhone 11

1. เปิดแอป **Auto Scroll TikTok**
2. เปิดแอป **TikTok** ให้พร้อม
3. กลับมาที่แอป **Auto Scroll TikTok**
4. ปรับแต่งการตั้งค่า (ถ้าต้องการ):
   - หน่วงเวลาระหว่างเลื่อน: 1 วินาที
   - หน่วงเวลาระหว่างลูป: 1 วินาที
5. กดปุ่ม **"เริ่ม"**
6. แอปจะเริ่มเลื่อนขึ้น-ลงอัตโนมัติ

## 🔧 แก้ไขปัญหา

### ปัญหา: "Untrusted Developer"
**แก้ไข:**
1. ไปที่ **Settings > General > VPN & Device Management**
2. แตะ **Developer App** (Apple ID ของคุณ)
3. กด **"Trust [Your Apple ID]"**

### ปัญหา: Xcode ไม่เห็น iPhone 11
**แก้ไข:**
1. ตรวจสอบว่าเชื่อมต่อ USB แล้ว
2. ปลดล็อก iPhone
3. แตะ **"เชื่อถือคอมพิวเตอร์"**
4. รอให้ Xcode ตรวจจับ (อาจใช้เวลาสักครู่)

### ปัญหา: Build Failed
**แก้ไข:**
1. ตรวจสอบว่าเลือก Team ใน Signing แล้ว
2. ลอง Clean Build Folder: **Product > Clean Build Folder** (⇧⌘K)
3. ลอง Build ใหม่: **Product > Build** (⌘B)

### ปัญหา: แอปไม่เลื่อนหน้าจอ
**แก้ไข:**
1. ตรวจสอบว่าให้สิทธิ์ Accessibility แล้ว
2. ลองใช้ **Shortcuts app** แทน (ดู `SHORTCUTS_GUIDE.md`)
3. ตรวจสอบว่า TikTok อยู่ในโฟกัส

## 💡 คำแนะนำสำหรับ iPhone 11

- **ใช้ Shortcuts App**: วิธีที่ดีที่สุดสำหรับ iPhone 11 คือใช้ Shortcuts app (ดู `SHORTCUTS_GUIDE.md`)
- **อัพเดท iOS**: ตรวจสอบว่า iPhone 11 ใช้ iOS 13.0 หรือสูงกว่า
- **ประหยัดแบตเตอรี่**: การเลื่อนอัตโนมัติจะใช้แบตเตอรี่มากขึ้น

## 📝 หมายเหตุ

- แอปนี้ต้อง build จาก Xcode เท่านั้น (ไม่สามารถดาวน์โหลดจาก App Store ได้)
- ต้องเชื่อมต่อกับ Mac เพื่อ build และติดตั้ง
- สำหรับการใช้งานจริง แนะนำให้ใช้ **Shortcuts app** เพราะใช้งานง่ายกว่าและไม่ต้อง build

