Docker image with [dehydrated](https://github.com/lukas2511/dehydrated) and [CloudFlare hook installed](https://github.com/kappataumu/letsencrypt-cloudflare-hook).

```shell
make build
```

Use staging server
```shell
export CF_EMAIL=test@domain.com
export CF_KEY=1234abcdef...
export DOMAIN=domain.com
make staging
```

Use prod server
```shell
export CF_EMAIL=test@domain.com
export CF_KEY=1234abcdef...
export DOMAIN=domain.com
make prod
```
