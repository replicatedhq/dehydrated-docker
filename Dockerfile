FROM ubuntu:14.04

RUN apt-get update -y --force-yes && \
  apt-get install -y --force-yes git python-pip python2.7-dev libffi-dev libssl-dev curl && \
  cd / && git clone https://github.com/lukas2511/dehydrated && \
  cd /dehydrated && \
  mkdir hooks && \
  git clone https://github.com/kappataumu/letsencrypt-cloudflare-hook hooks/cloudflare && \
  apt-get purge git -y --force-yes && \
  rm -rf /var/lib/apt/lists/*

RUN pip install -r /dehydrated/hooks/cloudflare/requirements.txt
RUN pip install pyOpenSSL idna ndg-httpsclient pyasn1 cryptography

ENTRYPOINT ["/bin/bash"]
