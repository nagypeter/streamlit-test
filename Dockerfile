# FROM python:3.7
FROM amazonlinux

# in case of python:3.7 image the following command is not necessary
RUN yum -y install python3-pip && yum -y clean all && rm -fr /var/cache

WORKDIR /app

COPY requirements.txt ./requirements.txt

# RUN pip install -r requirements.txt
RUN pip3 install -r requirements.txt

EXPOSE 8501

COPY test_app.py /app

ENTRYPOINT ["streamlit", "run"]

CMD ["test_app.py"]