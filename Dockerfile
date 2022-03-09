FROM alpine
ENV PYTHONUNBUFFERED=1
ENV WORKDIR=/data
ENV WAITTIME=7200
RUN apk add --update --no-cache python3 curl ffmpeg && ln -sf python3 /usr/bin/python
RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/download/2021.11.10.1/yt-dlp -o /usr/local/bin/yt-dlp && chmod +x /usr/local/bin/yt-dlp
COPY entrypoint.sh /usr/local/bin
COPY rename-in-folder /usr/local/bin
ENTRYPOINT entrypoint.sh
