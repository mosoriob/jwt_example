FROM golang:1.11 AS build
WORKDIR /go/src
COPY go ./go
COPY main.go .

ENV GO111MODULE=on
ENV CGO_ENABLED=0

COPY go.mod .
COPY go.sum .
RUN go mod download
RUN go build -a -installsuffix cgo -o openapi .
FROM scratch AS runtime
ENV GIN_MODE=release
COPY --from=build /go/src/openapi ./
EXPOSE 8080/tcp
ENTRYPOINT ["./openapi"]
