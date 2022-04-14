FROM golang:1.16-buster AS build
WORKDIR /app
COPY go.mod ./
COPY *.go ./
RUN go build -o /hello

FROM scratch
WORKDIR /
COPY --from=build /hello .
CMD [ "/hello" ]
