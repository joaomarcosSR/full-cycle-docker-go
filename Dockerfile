FROM golang:latest AS builder

WORKDIR /app/src

COPY src /app/src/

RUN go build


FROM hello-world:linux

WORKDIR /app/src

COPY --from=builder /app/src/education /app/src/

CMD [ "./education" ]