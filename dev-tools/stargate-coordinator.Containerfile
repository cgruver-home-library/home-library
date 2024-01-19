FROM image-registry.openshift-image-registry.svc:5000/dev-tools/stargate-coordinator-4_0:v2

ARG USER_HOME_DIR="/home/stargate"
ARG WORK_DIR="/stargate"
ENV HOME=${USER_HOME_DIR}

USER 0

RUN mkdir -p ${USER_HOME_DIR} ; \
  chmod -R g=u /etc/passwd /etc/group ; \
  chgrp -R 0 /home ${WORK_DIR}; \
  chmod -R g=u /home ${WORK_DIR}

WORKDIR ${WORK_DIR}
ENTRYPOINT [ "/stargate/starctl" ]
