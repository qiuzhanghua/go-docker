FROM golang:1.12 as gobuilder
COPY . /work
WORKDIR /work
RUN useradd app
RUN go build -ldflags="-w -s" -o hello

FROM scratch
COPY --from=gobuilder /work/hello /usr/bin/hello
COPY --from=gobuilder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=gobuilder /etc/passwd /etc/
USER app
ENTRYPOINT ["/usr/bin/hello"]

# docker build -t hello-go .
# docker run --rm hello-go
# docker images
#       hello-go images size = 1.88M






# if build locally , be sure under linux 64
# or
# GOOS=linux GOARCH=amd64 go build 
#FROM scratch
#ADD ./hello /usr/bin/hello
#ENTRYPOINT ["/usr/bin/hello"]
