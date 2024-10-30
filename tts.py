from gtts import gTTS
import os

# อ่านข้อความจากไฟล์
with open('text.txt', 'r', encoding='utf-8') as file:
    text = file.read()

# สร้างวัตถุ TTS
tts = gTTS(text=text, lang='th')

# บันทึกไฟล์เสียง
tts.save("hello_thailand.mp3")

# เล่นไฟล์เสียง
os.system("start hello_thailand.mp3")  # สำหรับ Windows
# os.system("mpg321 hello_thailand.mp3")  # สำหรับ Linux
# os.system("afplay hello_thailand.mp3")  # สำหรับ MacOS
