FROM python:3.11.5-alpine3.18 AS base

RUN python3 -m venv /venv
ENV PATH=/venv/bin:$PATH

COPY ./semver/semver.sh /usr/bin/semver
COPY requirements.txt /requirements.txt


RUN apk --no-cache add git=2.40.1-r0 \
    curl=8.5.0-r0 \
    xmlstarlet=1.6.1-r2 \ 
    exiftool=12.60-r0 \ 
    bash=5.2.15-r5 \
    openssl=3.1.4-r1 \
    yq=4.33.3-r5 \
    jq=1.6-r3 && \
    rm -rf /var/cache/apk/* && \
    curl -sLS "https://dl.k8s.io/release/v1.28.4/bin/linux/amd64/kubectl" -o /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl && \
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 &&\
    chmod +x get_helm.sh && ./get_helm.sh --version v3.13.2  && rm ./get_helm.sh && \   
    chmod +x /usr/bin/semver && \
    curl -Lo ./sops "https://github.com/mozilla/sops/releases/download/v3.8.1/sops-v3.8.1.linux.amd64" && \
    chmod +x ./sops && mv ./sops /usr/local/bin/ && mkdir ~/.sops && \
    pip install --no-cache-dir -r requirements.txt
    