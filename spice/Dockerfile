FROM fedora:27

COPY root /
RUN dnf install -y  vim which findutils procps-ng openssl spice-vdagent \
                    xorg-x11-server-Xspice git xorg-x11-drv-qxl which && \
    touch /etc/machine-id

ENV APP_ROOT=/opt/app-root
ENV PATH=${APP_ROOT}/bin:${PATH} HOME=${APP_ROOT}
COPY bin/ ${APP_ROOT}/bin/

# Download and install chisel which is used to
# proxy spice
# https://github.com/jpillora/chisel
RUN curl https://i.jpillora.com/chisel! | bash && \
    chmod -R u+x ${APP_ROOT}/bin && \
    chgrp -R 0 ${APP_ROOT} /etc/passwd && \
    chmod -R g=u ${APP_ROOT} /etc/passwd /etc/machine-id /etc/X11/spiceqxl.xorg.conf /etc/hostname

USER 10001
WORKDIR ${APP_ROOT}

ENTRYPOINT [ "uid_entrypoint" ]
EXPOSE 8080
CMD run /usr/bin/code -w
