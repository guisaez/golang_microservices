FROM golang:1.22 as builder

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN CGO_ENABLED=0 go build -o listenerService ./

RUN chmod +x /app/listenerService

FROM alpine:latest

RUN mkdir /app

WORKDIR /app

COPY --from=builder /app/listenerService /app/listenerService

CMD ["/app/listenerService"]