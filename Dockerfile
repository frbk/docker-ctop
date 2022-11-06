FROM golang:1.18.8-alpine3.16 AS builder

RUN apk add --no-cache make git

WORKDIR /ctop

RUN git clone https://github.com/bcicen/ctop.git . && \
    make build

FROM scratch
COPY --from=builder /ctop/ctop /ctop
ENTRYPOINT [ "/ctop" ]
