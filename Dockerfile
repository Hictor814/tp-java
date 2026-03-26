FROM maven:3.3-jdk-8 as builder
WORKDIR .
RUN mvn clean install -T4
#This will generate the jar file in <PATH_TO_MY_JARFILE>