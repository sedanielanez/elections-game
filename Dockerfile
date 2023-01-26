FROM python:3.10

RUN apt-get update
RUN apt-get install -y postgresql-client

COPY Pipfile .
COPY Pipfile.lock .
#COPY ./requirements.txt /code/requirements.txt

RUN pip install -U pip && pip install pipenv
RUN pipenv install --system --ignore-pipfile

#RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
WORKDIR /usr/src/app

COPY . /usr/src/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "9000"]