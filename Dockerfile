FROM geodata/gdal:2.1.3

COPY . /srv

WORKDIR /srv

RUN apt-get update -y

RUN apt-get install -y libspatialindex-dev unar bc

RUN pip install -r requirements.txt

RUN chmod +x *.sh

RUN ./create-dataset.sh

RUN apt-get clean

CMD python server.py

EXPOSE 8080
