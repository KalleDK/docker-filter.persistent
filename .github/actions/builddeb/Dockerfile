FROM debian:11-slim
RUN apt update -q -y && apt install make -q -y
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh