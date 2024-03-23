FROM alpine:3.16.2 as builder

WORKDIR /opt/

RUN apk add curl protoc musl-dev gzip git


# tonic-autometrics
RUN curl -sLO https://github.com/yistabraq/tonic-autometrics/releases/download/latest/tonic-autometrics-x86_64-unknown-linux-gnu.tar.gz \
  && tar -xvf tonic-autometrics-x86_64-unknown-linux-gnu.tar.gz \
  && chmod +x tonic-autometrics

#########################################################

FROM alpine:3.16.2

RUN apk add tmux

COPY --from=builder /opt/tonic-autometrics /opt/tonic-autometrics

RUN chown -R root:root /opt/

EXPOSE 50051
EXPOSE 8080

CMD ./opt/tonic-autometrics