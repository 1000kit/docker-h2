FROM 1000kit/base-jdk

MAINTAINER 1000kit <docker@1000kit.org>


LABEL Vendor="1000kit" \
      License=GPLv3 \
      Version=1.0.0

USER root

ENV H2DIR=/opt/h2 \
    H2VERS=1.3.176 \
    H2DATA=/opt/h2-data \
    H2CONF=/opt/h2-conf

ADD install/h2-start.sh /tmp/  

#   curl -L http://www.h2database.com/h2-2016-10-31.zip -o /tmp/h2.zip \
RUN mkdir -p ${H2CONF} ${H2DATA}/data \ 
    && groupadd -r h2 -g 2000 \
    && useradd -l -u 2000 -r -g h2 -m -d ${H2DATA}/data -s /sbin/nologin -c "h2 user" h2 \
    
    && curl -L http://www.h2database.com/h2-2014-04-05.zip -o /tmp/h2.zip \

    && unzip -q /tmp/h2.zip -d /opt/ \
    && rm /tmp/h2.zip \
    
    && mv /tmp/h2-start.sh ${H2DIR}/bin \
    && chmod 755 ${H2DIR}/bin/h2-start.sh  ${H2DIR}/bin/h2.sh \
    
    && chown -R h2:h2 /opt/h2*
    
USER h2  

      
WORKDIR ${H2DIR}

VOLUME ${H2DATA}

EXPOSE 8181 1521

CMD ["/opt/h2/bin/h2-start.sh"]


#end      