FROM progresssoftware/prgs-oedb:12.2.12_ent
LABEL maintainer="kennethherring@gmail.com"

USER root
# WORKDIR /root
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
# RUN ant -version && \
#     echo JAVA_HOME="'$JAVA_HOME'" && \
#     exit 1

COPY src src
COPY schema schema
COPY build.xml build.xml
COPY .docker/db_test.p db_test.p
COPY .docker/deploy/scripts/ /deploy/scripts/
COPY .docker/temp/ablunit.pl /psc/dlc/tty/ablunit.pl
# COPY progress.cfg /psc/dlc/progress.cfg

ARG PROGRESS_CFG
# RUN echo "PROGRESS_CFG='$PROGRESS_CFG'"
# RUN echo "$PROGRESS_CFG" > /psc/dlc/progress.cfg
# RUN cat /psc/dlc/progress.cfg
RUN echo "JAVA_HOME"

RUN echo JAVA_HOME="'$JAVA_HOME'" && \
    ant -version && \
    which ant && \
    whereis ant && \
    pwd && \
    echo "HOME=$HOME" && \
    whoami
RUN pwd && \
    ls -al && \
    mkdir -p target/temp /psc/wrk/sp2k && \
    chmod -R 777 /psc/wrk
    # chmod -R 777 /root
# RUN ls -al target/temp && \
#     touch target/temp/somefile.lg && \
#     ls -al target/temp  && \
#     pwd && \
#     ant create-db -DDB_DIR=/psc/wrk/sp2k

RUN --mount=type=secret,id=PROGRESS_CFG,uid=1000,gid=1000 \
    whoami && \
    ls -al /run/secrets && \
    rm /psc/dlc/progress.cfg && \
    cp /run/secrets/PROGRESS_CFG "$DLC/progress.cfg" && \
    ant create-db -DDB_DIR=/psc/wrk/sp2k && \
    rm "$DLC/progress.cfg" && \
    if [ -f /psc/wrk/sp2k/sp2k.prostrct.log ]; then cat /psc/wrk/sp2k/sp2k.prostrct.log; fi && \
    [ -f /psc/wrk/sp2k/sp2k.db ] || exit 1

# # Testing DB Startup
# RUN --mount=type=secret,id=PROGRESS_CFG,uid=1000,gid=1000 \
#     echo 100 && \
#     cd /psc/wrk/sp2k && \
#     echo 101 && \
#     cp /run/secrets/PROGRESS_CFG "$DLC/progress.cfg" && \
#     echo 102 && \
#     proserve sp2k -S 2500 -minport 2600 -maxport 2610 && \
#     echo 103 && \
#     ps -ef && \
#     echo 104 && \
#     _progres -b -p ~/db_test.p | tee && \
#     echo 105 && \
#     rm "$DLC/progress.cfg" && \
#     echo 106 && \
#     cat sp2k.lg && \
#     echo 107 && \
#     exit 1

RUN [ ! -f "$DLC/progress.cfg" ] && exit 0; \
    echo "ERROR: the '$DLC/progress.cfg' file should not exist!"; \
    cat "$DLC/progress.cfg"; \
    exit 1
