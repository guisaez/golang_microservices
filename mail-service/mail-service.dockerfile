FROM golang:1.22 as builder

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN CGO_ENABLED=0 go build -o mailService ./cmd/api

RUN chmod +x /app/mailService

FROM alpine:latest

RUN mkdir /app

WORKDIR /app

COPY --from=builder /app/templates /app/templates
COPY --from=builder /app/mailService /app/mailService

CMD ["/app/mailService"]