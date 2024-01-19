FROM image-registry.openshift-image-registry.svc:5000/dev-tools/stargate-coordinator-4_0:v2 as stargate-release
# FROM docker.io/stargateio/coordinator-4_0:v2 as stargate-release

FROM registry.access.redhat.com/ubi9/ubi-minimal

ARG USER_HOME_DIR="/home/stargate"
ARG WORK_DIR="/stargate"
ARG JAVA_PACKAGE=java-1.8.0-openjdk-devel
ENV HOME=${USER_HOME_DIR}
ENV JAVA_HOME=/etc/alternatives/jre_1.8.0_openjdk
ENV CASSANDRA_LIBJEMALLOC=-

COPY --from=stargate-release /stargate/ /stargate

RUN microdnf --disableplugin=subscription-manager install -y procps-ng openssl git tar gzip zip xz unzip which shadow-utils bash zsh vi wget jq ca-certificates iproute ${JAVA_PACKAGE}; \
  microdnf update -y ; \
  microdnf clean all ; \
  mkdir -p ${USER_HOME_DIR} ; \
  chmod -R g=u /etc/passwd /etc/group ; \
  chgrp -R 0 /home ; \
  chmod -R g=u /home ${WORK_DIR}

WORKDIR ${WORK_DIR}
ENTRYPOINT [ "/stargate/starctl" ]
