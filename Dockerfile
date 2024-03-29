# syntax=docker/dockerfile:1

##
## Build
##
FROM golang:1.20.5-buster AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /gapp

##
## Deploy
##
FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /gapp /gapp

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/gapp"]
