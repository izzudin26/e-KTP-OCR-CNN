FROM python:3.9

WORKDIR /app

RUN pip install flask
RUN pip install numpy
RUN pip install opencv-contrib-python==4.5.1.48
RUN pip install pandas
RUN pip install pillow
RUN apt-get install tesseract-ocr
RUN apt-get install tesseract-ocr-ind
RUN pip install pytesseract
RUN pip install textdistance

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]