FROM alpine:latest
MAINTAINER wyl316430@163.com
ARG TZ="Asia/Shanghai"
RUN apk add tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata && \
    apk upgrade && \
    apk add ca-certificates && \
    update-ca-certificates && \
    apk add --update openjdk8-jre && \
    apk add bash && \
    wget https://archive.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz  && \ 
    tar -xvf apache-maven-3.6.0-bin.tar.gz && \
    mv apache-maven-3.6.0 /maven
ENV MAVEN_HOME=/maven
ENV PATH $MAVEN_HOME/bin:$PATH
