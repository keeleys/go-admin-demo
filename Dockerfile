FROM golang:1.11-alpine AS builder
RUN apk add --no-cache git
WORKDIR /project
COPY ./ .

RUN export GOPROXY=https://goproxy.cn && \
    GO111MODULE=on CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' -o main main.go

FROM scratch
COPY --from=builder /project/main /main
EXPOSE 9033
ENTRYPOINT ["/main"]
