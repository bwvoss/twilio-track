FROM golang:1.17

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY *.go ./

RUN go build -o /twilio-track

EXPOSE 8080

CMD ["/twilio-track"]