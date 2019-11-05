FROM debian:buster-slim
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		ocproxy \
		openconnect \
	; \
	rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /opt

EXPOSE 9052

ENTRYPOINT ["/opt/entrypoint.sh"]
