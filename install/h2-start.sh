#!/bin/sh

cd /opt
env | grep H2

${H2DIR}/bin/h2.sh \
	-properties "${H2CONF}" \
	-baseDir "${H2DATA}" \
 	-web \
 	-webAllowOthers \
 	-webPort 8181 \
 	-tcp \
 	-tcpAllowOthers \
 	-tcpPort 1521
 	
#end