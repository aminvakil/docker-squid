# docker-squid
Minimal Docker Image based on alpine running squid

## Usage
```
docker run -d -p 3128:3128 quay.io/aminvakil/squid
```
Beware that this command runs an open proxy from everywhere to everywhere.

You should either block it in docker-user chain or from a firewall which is in front of your server.


This was meant to be a minimal image supporting basic authentication, but as alpine squid package doesn't support basic authentication by default and other type of authentications need another package to be installed, this reverted to a really really basic squid.
