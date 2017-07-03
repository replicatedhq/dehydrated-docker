.PHONY: docker staging prod

build:
	docker build -t dehydrated:0.0.1 .

staging:
	docker run -it --rm --name dehydrated \
		-v "`pwd`"/dehydrated-staging.config:/etc/dehydrated/config \
		-v "`pwd`"/certs:/etc/dehydrated/certs \
		-e CF_DEBUG="true" \
		-e CF_EMAIL="$(CF_EMAIL)" \
		-e CF_KEY="$(CF_KEY)" \
		dehydrated:0.0.1 \
		/dehydrated/dehydrated -c -d $(DOMAIN) --force -t dns-01 --accept-terms -k /dehydrated/hooks/cloudflare/hook.py

prod:
	docker run -it --rm --name dehydrated \
		-v "`pwd`"/certs:/dehydrated/certs \
		-e CF_DEBUG="true" \
		-e CF_EMAIL="$(CF_EMAIL)" \
		-e CF_KEY="$(CF_KEY)" \
		dehydrated:0.0.1 \
		/dehydrated/dehydrated -c -d $(DOMAIN) --force -t dns-01 --accept-terms -k /dehydrated/hooks/cloudflare/hook.py
