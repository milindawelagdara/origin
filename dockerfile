FROM centos:7
MAINTAINER milindawelgedara@gmail.com


# Upgrading system
RUN yum -y upgrade && \
    yum install -y wget && \
    wget "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn/java/jdk/7u25-b15/jre-7u25-linux-x64.rpm" > /tmp/jdk-7-linux-x64.rpm && \
    yum -y install /tmp/jdk-*-linux-x64.rpm && \
    yum clean all && rm -rf /tmp/jdk*-linux-x64.rpm


RUN alternatives --install /usr/bin/java jar /usr/java/latest/bin/java 200000 && \
    alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 200000 && \
    alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000

ENV JAVA_HOME /usr/java/latest
