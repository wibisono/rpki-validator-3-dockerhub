FROM centos/systemd

RUN yum -y install https://ftp.ripe.net/tools/rpki/validator3/rc/centos7/repo/rpki-validator-3.0-406.noarch.rpm; 
RUN yum clean all; systemctl enable rpki-validator-3.service
RUN sed -i "s/server.address=localhost/server.address=0.0.0.0/g" /etc/rpki-validator-3/application.properties
RUN sed -i "s/rpki-validator.h2/rpki-validator.h2;MULTI_THREADED=true;MVCC=true;LOCK_MODE=1;/g" /etc/rpki-validator-3/application-defaults.properties

EXPOSE 8080

CMD ["/usr/sbin/init"]
