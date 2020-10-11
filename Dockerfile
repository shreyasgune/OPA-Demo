FROM golang:1.14.0-alpine3.11 as builder 
LABEL author="sgune@pm.me"
WORKDIR app
COPY go.mod .
COPY go.sum .
RUN go mod download
RUN GOOS=linux GOARCH=amd64 go build -o /app main.go

FROM alpine:latest
CMD ["./app"]
COPY --from=builder /app 