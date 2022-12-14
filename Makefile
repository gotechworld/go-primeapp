.PHONY: default
default: build

all: clean get-deps build test

version := "1.0.0"

build:
  mkdir -p bin
  go build -o bin/service-sonar main.go

test: build
  go test -short -coverprofile=bin/cov.out `go list ./... | grep -v vendor/`
  go tool cover -func=bin/cov.out

clean:
  rm -rf ./bin

sonar: test
  sonar-scanner -Dsonar.projectVersion="$(version)"

start-sonar:
  docker image run --no-cache --name sonarqube -p 9000:9000 sonarqube:community
		
