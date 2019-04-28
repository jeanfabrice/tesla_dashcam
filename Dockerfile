FROM python:3-alpine

WORKDIR /usr/src/app/tesla_dashcam
ADD . .

RUN apk add -U ffmpeg gcc musl-dev linux-headers \
    && pip install -r requirements.txt \
    && apk del gcc musl-dev linux-headers \
    && rm -rf /var/cache/apk/*apk
 
ENV PYTHONUNBUFFERED=true

ENTRYPOINT [ "python", "tesla_dashcam/tesla_dashcam.py" ]