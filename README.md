# GO app

Sample go web server.

The focus here is on containerizing an application not on the application itself.

The content of this repo is derived from the following guides and repos:

- [docker and Go](https://docs.docker.com/language/golang/)
- [docker-gs-ping](https://github.com/olliefr/docker-gs-ping)

The [Dockerfile](./Dockerfile) is using a multistage build.

Build the image:

```console
docker build --tag gapp .
```

Run it:

```console
docker run -d -p 8080:8080 --tty gapp
```

Test the access using curl:

```console
curl -v http://localhost:8080/
```
