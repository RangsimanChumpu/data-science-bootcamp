# Basic Systax
ggplot(data = mtcars,    # ใช้คำสั่ง data = ชื่อของเดต้าเฟรม
       mapping = aes(x = mpg)) + # คำสั่ง mapping คือการบอกให้คอลัมน์ไปอยู่ในเเกน x หรือ y
  geom_histogram(bins=8) # geom ตามด้วยชื่อกราฟที่เราต้องการ ตัวอย่างคือ histogram (bins คือจน.บาร์)
# คำว่า data เเละ mapping ไม่ต้องใส่ก็ได้

# Ordinal Factor คือคอลัมน์ที่มีค่าที่สามารถเรียงระดับได้ เช่น good, very good, excellent
 temp_or <- factor(temp, #ชื่อคอลัมน์
									levels = c("low", "medium", "high"), # ระดับที่เราต้องการเรียง
									ordered = TRUE)
#Levels: low < medium < high
#class(ordered factor)

# เราสามารถเก็บโค้ดส่วน base คือ ตรง data เเละ mapping เก็บไว้ในตัวเเปรได้ เพื่อง่ายต่อการเรียกใช้งาน
base <- ggplot(diamonds, aes(x=price)) #เก็บไว้ในตัวเเปร base
base + geom_density() # สร้างกราฟไปได้เรื่อยๆ บรรทัดนี้สามารถเก็บค่าไว้ในตัวเเปรได้

# การสร้าง chart ที่ผ่านการ aggregate data มาเเล้ว
diamonds %>%
  count(cut) %>% #จะได้มา 2 คอลัมน์คือ cut กับ n
  ggplot(data = ., mapping=aes(x=cut, y=n)) + #กำหนดเเกน
  geom_col() #ใช้กับข้อมูลที่ผ่านการ aggregate มาเเล้ว ถ้าเป็นข้อมูลดิบจะเป็น geom_bar()
# จะได้ bar chart ออกมา

# mapping vs. setting
ggplot(diamonds,
       #mapping คือการนำค่าของคอลัมน์ยัดเข้าไปในกราฟ
       mapping = aes(x=carat, y= price,
                     color=cut)) +
  #setting คือการปรับ element ของกราฟ
  geom_point(alpha=0.4, size=5) + #alpha มีค่า 0-1 ค่าความเข้มกราฟ, size คือขนาด
	theme_minimal() #เปลี่ยนพื้นหลังเพื่อให้ดูง่ายขึ้น
#ได้กราฟ scatter plot

# การสุ่ม
set.seed(1) #คือการเซตให้ค่าสุ่มันคงที่ กราฟที่ได้จากการสุ่มจะเหมือนเดิม ในวงเล็บใส่เลขอะไรก็ได้
ggplot(diamonds %>% sample_n(500), #สุ่ม n = 500 หรือจะเขียน sample_n(diamonds,3000) ก็ได้
      #mapping
      mapping = aes(x=carat, y= price,
              color=cut)) +
  #setting
  geom_point(alpha=0.4, size=2) +
  theme_minimal()

# การใส่ชื่อต่างๆบนกราฟ
set.seed(1)
ggplot(diamonds %>% sample_n(500),
      #mapping
      mapping = aes(x=carat, y= price,
              color=cut)) +
  #setting
  geom_point(alpha=0.4, size=2) +
  theme_minimal() +
  labs(
    title = "My first scatter plot",
    subtitle = "Coll ggplot2",
    caption = "Data diamonds in Africa",
    y = "Price in USD",
    x= "Carat Diamonds"
  )

# ดาวน์โหลด themes
library(ggthemes) # ติดตั้ง package ggthemes ก่อน
set.seed(1)
ggplot(diamonds %>% sample_n(500),
      #mapping
      mapping = aes(x=carat, y= price,
              color=cut)) +
  #setting
  geom_point(alpha=0.4, size=2) +
  labs(
    title = "My first scatter plot",
    subtitle = "Coll ggplot2",
    caption = "Data diamonds in Africa",
    y = "Price in USD",
    x= "Carat Diamonds"
  ) +
  theme_economist() #สามารถเลือก themes ได้หลายเเบบ

# shortcut qplot() สร้างกราฟเเบบเร็วๆ
qplot(x = carat, data = diamonds, geom = "density")
qplot(x = carat, data = diamonds, geom = "histogram")
qplot(cut, data = diamonds, geom = "bar")

# layers in ggplot2
base <- ggplot(diamonds %>%
                 sample_n(1000),
               aes(x=carat, y=price)) #สร้าง base ขึ้นมาก่อน
base + 
  theme_minimal() +
  geom_point(alpha=0.2, color="green") + # plot จุด
  geom_smooth(method="loess", se=TRUE, 
              fill="gold",
              color="red")  #คือเส้นที่ผ่าตรงกลาง method:เลือกประเภทเส้น se:ขอบเส้น fill:สีขอบ color:สีเส้น
	geom_rug() #ดูความเข้มของจุดที่มันซ้อนกัน

# bar plot
ggplot(diamonds, aes(cut, fill=clarity)) + #กราฟจะเป็นสเเต๊กบาร์เเยกประเภทตาม clarity
  geom_bar() + 
  theme_minimal()
ggplot(diamonds, aes(cut, fill=clarity)) +
  geom_bar(position="fill") + #กราฟจะเป็นเเบบเต็ม 100% ถ้าเปลี่ยนเป็น dodge กราฟจะเรียงกัน
  theme_minimal()

# การเปลี่ยน bar chart เเบบ manual
ggplot(diamonds, aes(cut, fill=cut)) +
  geom_bar() +
  theme_minimal() +
  scale_fill_manual(values = c(
    "red", "green","blue","gold","black"
  ))

# การใช้ color palette ใน bar chart
ggplot(diamonds, aes(cut, fill=cut)) +
  geom_bar() +
  theme_minimal() +
  scale_fill_brewer(palette = "accent") # color code in google

# heat map color
ggplot(diamonds %>%
         sample_frac(0.1), aes(carat,price, color=price))+ #sample_frag คือการสุ่มออกมาเป็น %
  geom_point(alpha=0.3) +
  theme_minimal() +
  scale_color_gradient(low = "gold", high = "red") 

# multiple sub-point คือการซอยย่อยกราฟ
ggplot(diamonds %>%
         sample_frac(0.2), aes(carat,price)) +
  geom_point(alpha=0.2) +
  geom_smooth() +
  theme_minimal() +
  facet_grid(~cut, ncol=3) #ncol คือ กราฟย่อยทำออกมากี่คอลัมน์
# ถ้าเป็น facet_wrap คือกราฟใส่เข้าไป 2 คอลัมน์เเบบนี้ (clarity ~cut)

# multiple dataframes
m1 <- mtcars %>% filter(mpg > 30)
m2 <- mtcars %>% filter(mpg <= 20)

ggplot() +
  theme_minimal() +
  geom_point(data=m1, aes(wt, mpg), color="blue") +
  geom_point(data=m2, aes(wt, mpg), color = "red")

library(patchwork)
p1 <- qplot(hwy, data=mpg, geom='density')
p2 <- qplot(cty, data=mpg, geom='histogram')
p3 <- qplot(cty, hwy, data=mpg, geom='point')
p4 <- qplot(cty, hwy, data=mpg, geom='smooth')

p1 + p2 + p3 + p4 # สามารถเล่นกับตรงนี้ได้ (p1 + p2 + p3) / p4 เอากราฟ p4 ลงไปยังด้านล่าง เป็นต้น

# basic plots
hist(mtcars$hp)

# Histogram
mean(mtcars$hp)
median(mtcars$hp)

# convert num to factor
str(mtcars)
mtcars$am <- factor(mtcars$am,
                    levels = c(0,1),
                    labels = c("auto", "manual"))

# bar plot
barplot(table(mtcars$am))

# box plot
boxplot(mtcars$hp)

# หา quantile เเบบเร็วๆ
fivenum(mtcars$hp)

# whisker calculation
Q3 <- quantile(mtcars$hp, probs = .75)
Q1 <- quantile(mtcars$hp, probs = .25)
IQR_hp <- Q3-Q1

Q3 + 1.5*IQR_hp
Q3 - 1.5*IQR_hp

boxplot.stats(mtcars$hp, coef = 1.5) # หา Outlier

# box plot 2 variables
data(mtcars) # โหลด original data set
mtcars$am <- factor(mtcars$am,
                    levels = c(0,1),
                    labels = c("auto", "manual"))
boxplot(mpg ~ am, data = mtcars,
        col = c("gold", "salmon"))

# scatter plot
plot(mtcars$hp, mtcars$mpg, pch = 16, 
     col="blue",
     main = "Scatter plot",
     xlab = "Horse Power",
     ylab = "Mile Per Gallon")

cor(mtcars$hp, mtcars$mpg)
