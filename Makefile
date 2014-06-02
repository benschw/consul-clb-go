
all: build

deps:
	go get github.com/benschw/dns-clb-go/dns
	go get launchpad.net/goyaml

build:
	go build -o demo

test:
	go test ./...

