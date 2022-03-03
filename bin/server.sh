#!/bin/sh

NAME=pokemon-wiki
APP_WECHAT_TOKEN=$2

if [ -z ${APP_WECHAT_TOKEN} ]; then
    APP_WECHAT_TOKEN='I_Love_Pokemon'
fi

LOG_HOME=/var/log/$NAME
TOMCAT_LOG=$LOG_HOME/tomcat.log
TOMCAT_PID=$LOG_HOME/tomcat.pid

MAOMAO_DEPLOY_HOME="/opt/maomao/$NAME"

JVM_OPTS="${JVM_OPTS} -XX:+UseG1GC -Xms500m -Xmx500m -XX:MaxGCPauseMillis=500 -XX:+HeapDumpOnOutOfMemoryError"
JVM_OPTS="${JVM_OPTS} -Xlog:gc*:file=${LOG_HOME}/gc_%p.log::filecount=5,filesize=10M"
APP_OPTS="-Dapp.wechat.token=${APP_WECHAT_TOKEN} -Dapp.dbfile=${MAOMAO_DEPLOY_HOME}/pokemon_wiki.db"

case "$1" in
    start)
        if [ -f $TOMCAT_PID ]; then
            echo "$TOMCAT_PID exist, $NAME started already?"
		    exit 2
        fi
        echo "Starting $NAME ..."
        test -f $TOMCAT_LOG && rm $TOMCAT_LOG

        # start up command
        nohup java $JVM_OPTS $APP_OPTS -jar $MAOMAO_DEPLOY_HOME/pokemon-wiki-web.jar >> $TOMCAT_LOG &

        echo $! > $TOMCAT_PID
        if [ -f $TOMCAT_PID ] && [ -n `cat $TOMCAT_PID` ]; then
            echo "$NAME started"
        else
            echo "$NAME start failed !!!"
        fi
        ;;
    stop)
        kill `cat $TOMCAT_PID`
        rm -f cat $TOMCAT_PID
        echo "$NAME was stopped"
        ;;
    kill)
        kill -9 `cat $TOMCAT_PID`
        rm -f cat $TOMCAT_PID
        echo "$NAME was killed"
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 3
        ;;
esac
