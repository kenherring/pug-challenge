FROM progresssoftware/prgs-pasoe:12.2.12 AS pasoe
FROM progresssoftware/prgs-oedb:12.2.12_ent
COPY --from=pasoe /psc/dlc/bin /psc/dlc/bin
LABEL maintainer="kennethherring@gmail.com"

USER root
RUN --mount=type=cache,target=/var/cache/yum \
    yum -y upgrade && \
    yum -y install java-11-openjdk.x86_64 && \
    yum -y install ant which where
RUN JAVA_DIR=/usr/lib/jvm/jre-11-openjdk/ && \
    ln -s $JAVA_DIR /usr/java
RUN curl -v -L https://github.com/Riverside-Software/pct/releases/download/v226/PCT.jar -o /usr/share/ant/lib/PCT.jar

USER pscadmin
WORKDIR /home/pscadmin
ENV JAVA_HOME=/usr/java
ENV ANT_HOME=/usr/share/ant
ENV PATH=$JAVA_HOME/bin:$PATH:$ANT_HOME/bin
ENV DOCKER=true
ENV DB_CREATE_METHOD=none
ENV DB_NAME=sp2k

COPY src src
COPY schema schema
COPY build.xml build.xml
COPY .docker/deploy/scripts/ /deploy/scripts/
COPY .docker/temp/ablunit.pl /psc/dlc/tty/ablunit.pl

RUN echo JAVA_HOME="'$JAVA_HOME'" && \
    ant -version
RUN pwd && \
    ls -al && \
    mkdir -p target/temp /psc/wrk/sp2k && \
    chmod -R 777 /psc/wrk

RUN --mount=type=secret,id=PROGRESS_CFG,uid=1000,gid=1000 \
    rm /psc/dlc/progress.cfg && \
    cp /run/secrets/PROGRESS_CFG "$DLC/progress.cfg" && \
    ant create-db -DDB_DIR=/psc/wrk/sp2k && \
    rm "$DLC/progress.cfg" && \
    if [ -f /psc/wrk/sp2k/sp2k.prostrct.log ]; then cat /psc/wrk/sp2k/sp2k.prostrct.log; fi && \
    [ -f /psc/wrk/sp2k/sp2k.db ] || exit 1

#TODO after build validation?  No need for a step here.
RUN [ ! -f "$DLC/progress.cfg" ] && exit 0; \
    echo "ERROR: the '$DLC/progress.cfg' file should not exist!"; \
    cat "$DLC/progress.cfg"; \
    exit 1
