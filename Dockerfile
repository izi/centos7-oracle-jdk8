FROM centos:centos7

MAINTAINER Krzysztof Suchomski
# Fork of https://bitbucket.org/ariya/docker-centos/src/a89e0610f187c9f6a7c7586bd14562eace0c17c2/centos7-oracle-jre7/Dockerfile?at=master

RUN yum -y install wget && \
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31-linux-x64.rpm && \
    echo "be6abc353ef797755c1c9260c27422e9  jdk-8u31-linux-x64.rpm" >> MD5SUM && \
    md5sum -c MD5SUM && \
    rpm -Uvh jdk-8u31-linux-x64.rpm && \
    yum -y remove wget && \
    rm -f jdk-8u31-linux-x64.rpm MD5SUM

COPY US_export_policy.jar /usr/java/jdk1.8.0_31/jre/lib/security/US_export_policy.jar
COPY local_policy.jar /usr/java/jdk1.8.0_31/jre/lib/security/local_policy.jar
