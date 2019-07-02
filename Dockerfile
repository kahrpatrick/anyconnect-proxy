FROM ubuntu:disco
RUN apt-get update && apt-get install -y openconnect ocproxy curl

ADD entrypoint.sh /opt
RUN chmod +x /opt/entrypoint.sh

EXPOSE 9052

ENTRYPOINT ["/opt/entrypoint.sh"]
