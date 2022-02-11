FROM timberio/vector:0.20.0-debian

WORKDIR .

COPY ./etc/vector /etc/vector

ENTRYPOINT ["/usr/bin/vector", "--config", "/etc/vector/vector.yaml"]