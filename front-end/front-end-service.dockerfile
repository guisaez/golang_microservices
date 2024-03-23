FROM golang:1.18-alpine as builder

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN CGO_ENABLED=0 go build -o frontEnd ./cmd/web

RUN chmod +x /app/frontEnd

FROM alpine:latest

RUN mkdir /app

COPY --from=builder /app/ /app

CMD ["/app/frontEnd"]