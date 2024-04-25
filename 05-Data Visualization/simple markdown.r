# ก่อนอื่นให้ติดตั้ง Library "rmarkdown"
# เปิด new file > rmarkdown
# เขียนเหมือนก่อนหน้านี้ได้เลย 
# การเขียน code block ให้กด ตรงเเถบบาร์ด้านบนได้เลย รูปตัว C
# การ Knit คือการ import เป็น files ออกมาเเสดงผล จะเป็น HTML หรือ PDF ก็ได้

ถ้าต้องการให้ warning message ไม่มีให้ใส่ message=FALSE ตามหลัง {r,
เเละถ้าต้องการไม่ให้เเสดง code ให้ใส่ echo=FALSE ตามหลัง {r, 
เเละถ้าต้องการเเก้ขนาดของกราฟที่เเสดง ให้ใส่ fig.width=10 ตามหลัง {r,

# hello world 

## Thi sis another world

### Favorite Food

# การสร้าง LIST
- hamberger
- hot dog
- frech fries

# การใส่ number
1. Programming
2. SQL database

# text
Today, I'm learning markdown

# block code
```sql
SELECT * FROM customers
WHERE country = "USA";
```

```r
for (i in 1:10) {
    print("hello world")
}
```

# Link
[Google](https://www.google.com)

# Add pictures by copy adddress
![A Bear](https://www.nps.gov/articles/images/troy-hunt_buffalo001.JPG)

# *A Bear* ตัวเอียง
# **A Bear** ตัวหนา
# ***A Bear*** หนา+เอียง
# ___A Bear___ หนา+เอียง

# markline
Today, I'm learning `markdown`. It's a **very** cool.

# blockquote
> A mind once enlightend cannot  again become dark.

# simple table
Name | City
---  | ---
Top  | Chiangrai
Gun  | Bangkok
Toon | Lamphun                                                                  
