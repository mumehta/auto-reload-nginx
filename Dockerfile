FROM nginx
RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install inotify-tools -y
COPY ./nginxReloader.sh /usr/local/bin/nginxReloader.sh
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/nginxReloader.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD ["nginx", "-g", "daemon off;"]
