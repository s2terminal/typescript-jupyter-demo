FROM python:3.13-slim

WORKDIR /app

RUN pip install jupyterlab

# add Deno
RUN apt-get update && apt-get install -y curl zip unzip
RUN curl -fsSL https://deno.land/install.sh | DENO_INSTALL=/usr/local sh

RUN deno jupyter --install

CMD [ "jupyter", "lab", "--no-browser", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''" ]
