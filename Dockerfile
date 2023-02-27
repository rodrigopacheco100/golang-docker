# Building
FROM golang:alpine as builder

WORKDIR /app

COPY . .

RUN go build -o /main main.go

# Final production build
FROM scratch

COPY --from=builder /main /main

ENTRYPOINT [ "/main" ]
