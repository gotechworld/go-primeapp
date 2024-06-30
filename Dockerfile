# The stage at which the application is built
FROM --platform=linux/arm64 golang:1.19-alpine AS builder
RUN apk update && apk add --no-cache git
WORKDIR /app
COPY go.mod .
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -o /app/main .

# The stage at which the application is deployed
FROM --platform=linux/arm64 alpine:3
COPY --from=builder /app/main /app/main
ENTRYPOINT [ "/app/main" ]

# The Dockerfile above is a multi-stage build. 
# The first stage is the builder stage, which is used to build the application. 
# The second stage is the deployment stage, which is used to deploy the application. The --platform flag is used to specify the platform of the stage. The --from flag is used to specify the stage from which the artifacts are copied.

