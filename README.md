# PGSQL View โปรแกรมประเมินภาวะโภชนาการ

1. `nt_pt` ข้อมูลผู้ป่วยที่เข้ารักษาขณะอยู่ รพ. **ใช้ชื่อ field เป็นอักษรตัวใหญ่**
2. `nt_wardlist` ข้อมูลรายชื่อผู้ป่วยที่อยู่ใน ward *(ดึงเฉพาะคนไข้ที่คงพยาบาลเท่านั้น)*
3. `nt_food` ข้อมูลการได้รับอาหารของผู้ป่วย
4. `nt_ipt` ข้อมูลผู้ป่วยในสำหรับวิเคราะห์รายงาน

## HOSxPXE : Postgres

> โรงพยาบาลอ่างทอง สั่งอาหารผ่าน hosxp