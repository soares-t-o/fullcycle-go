FROM golang as builder

WORKDIR /usr/app

COPY  . /usr/app

RUN go build -o docker .

FROM hello-world

WORKDIR /usr/app/
COPY --from=builder /usr/app/ .

ENTRYPOINT [ "./docker" ]
