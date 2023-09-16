FROM progresssoftware/prgs-oedb:12.2.12_ent

USER root
RUN yum -y upgrade && \
    yum -y install java-11-openjdk.x86_64 && \
    yum -y install ant
WORKDIR /root/pscadmin


ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.20.0.8-1.el7_9.x86_64/
ENV PATH=$PATH:/usr/lib/jvm/java-11-openjdk-11.0.20.0.8-1.el7_9.x86_64/

USER pscadmin
WORKDIR /home/pscadmin
COPY src src
COPY schema.df schema.df
COPY build.xml build.xml
RUN mkdir -p ~/.ant/lib
RUN curl -v https://github.com/Riverside-Software/pct/releases/download/v226/PCT.jar -o /home/pscadmin/.ant/lib/PCT.jar && \
    ls -al /home/pscadmin/.ant/lib && \
    exit 1
RUN ls -al /home/pscadmin/.ant/lib && exit 1
RUN ant -lib /home/pscadmin/.ant/lib/PCT.jar create-dbs
