# go-docker


### Go >=1.12 required 
### Docker installed

## set env GOPROXY right
for China
```bash
GOPRXY=https://goproxy.io,direct
```
for other areas
```bash
GOPRXY=https://proxy.golang.org,direct
```

## run locally
```bash
go run hello.go
```
output as "你好，世界。"

## build locally
```bash
GOOS=linux GOARCH=amd64 go build
```

## build docker image
```bash
docker build --build-arg goproxy=${GOPROXY} -t hello-go .
```

## use docker run hello
```bash
docker run --rm hello-go
```
output as "Hello, world."


please notice 
```text
replace golang.org/x/text => github.com/golang/text v0.3.2
```
in go.mod
