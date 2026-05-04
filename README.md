# docker-squid

Minimal Docker image for running [Squid](http://www.squid-cache.org/) on Alpine Linux.

## Image

- Registry: `quay.io/aminvakil/squid`
- Exposed port: `3128`
- Default command: `squid -N`

The image uses Alpine's packaged Squid and makes only a few configuration changes so the proxy starts with permissive access rules. It does not add authentication helpers or custom proxy configuration.

## Usage

```sh
docker run -d --name squid -p 3128:3128 quay.io/aminvakil/squid:latest
```

Use it as an HTTP proxy on port `3128`.

> **Warning**
> Publishing this container directly creates an open proxy. Restrict access with firewall rules, Docker networking, or another control in front of the container.

Example binding only to localhost:

```sh
docker run -d --name squid -p 127.0.0.1:3128:3128 quay.io/aminvakil/squid:latest
```

## Tags and releases

GitHub releases are created from tags named like `v<package-version>-<release-number>`.

On tag builds, the GitHub Actions workflow publishes three Quay tags:

- an exact release tag, without the leading `v`
- a package-version tag, without the release suffix
- `latest` for the latest tagged release

See the GitHub releases page for available versions.

## Local build

```sh
docker build -t docker-squid .
docker run --rm -p 127.0.0.1:3128:3128 docker-squid
```

## License

See [LICENSE](LICENSE).
