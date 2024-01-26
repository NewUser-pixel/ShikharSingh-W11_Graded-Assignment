FROM python:3.10.12
RUN apt update && apt install -y dos2unix git curl
WORKDIR /app
RUN git clone https://github.com/Vikas098766/Microservices /app/Microservices
WORKDIR /app/Microservices
RUN pip install -r requirements.txt
RUN dos2unix tests/example_calls.txt
RUN python3 code_model_training/train.py
EXPOSE 5000
ENTRYPOINT python3 app.py 

