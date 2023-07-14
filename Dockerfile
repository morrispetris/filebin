FROM golang:1.19 AS build

WORKDIR /go/src/github.com/morrispetris/filebin
COPY . .
RUN go build -tags netgo -ldflags '-s -w' -o filebin

EXPOSE 5000
ENTRYPOINT ["filebin", "--port", "5000", "--access-log", "/tmp/access.log", "--filedir", "/tmp", "--baseurl", "https://filebingo.onrender.com"]
