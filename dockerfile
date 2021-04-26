FROM golang AS builder

WORKDIR /go/src

COPY main.go .

RUN go build main.go

FROM scratch

COPY --from=builder /go/src/main /main

CMD ["./main"]