FROM golang:1.17 as builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main ./cmd/api/.

FROM alpine:3.19  

WORKDIR /root/

COPY --from=builder /app/main .

EXPOSE 8081

CMD ["./main"] 