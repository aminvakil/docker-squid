# docker-squid
Minimal Docker Image based on alpine running squid

## Usage
```
docker run -d -p 3128:3128 aminvakil/squid
```
Beware that this command runs an open proxy from everywhere to everywhere.

You should either block it in docker-user chain or from a firewall which is in front of your server.
