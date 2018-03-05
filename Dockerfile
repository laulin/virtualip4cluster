From ubuntu:14.04

RUN apt-get update -y && apt-get install -y ucarp supervisor
COPY ucarp/ /opt/ucarp/
RUN chmod a+x /opt/ucarp/*.sh
COPY start.sh /start.sh
RUN chmod u+x /start.sh
COPY supervisord.conf /etc/supervisor/supervisord.conf

