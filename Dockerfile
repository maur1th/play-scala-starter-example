FROM openjdk:8-slim
RUN set -ex \
 && apt update \
 && apt install -y gnupg apt-transport-https \
 && echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823 \
 && apt update \
 && apt install -y sbt \
 && rm -rf /var/lib/apt/lists/*
COPY . /app
WORKDIR /app
RUN sbt compile
EXPOSE 9000
CMD sbt run
