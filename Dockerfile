FROM python:3.9

WORKDIR /app

RUN pip install flask
RUN pip install numpy==1.26.4
RUN pip install opencv-contrib-python==4.5.1.48
RUN pip install pandas
RUN pip install pillow
RUN apt-get update -y
RUN apt-get install ffmpeg libsm6 libxext6  -y
RUN apt-get install tesseract-ocr -y
RUN apt-get install tesseract-ocr-ind -y
RUN apt-get install curl -y
RUN pip install pytesseract
RUN pip install textdistance

COPY . .

RUN curl https://s24.filetransfer.io/storage/download/mSxxkPnc6OQn -o model.h5

RUN mkdir data/cnn
RUN mv model.h5 data/cnn

EXPOSE 5000

CMD ["python", "app.py"]