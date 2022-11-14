FROM kalilinux/kali-rolling
ARG KALI_DESKTOP=xfce
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        curl sudo apt-transport-https gnupg \
        x11vnc xvfb novnc dbus-x11 \
        kali-defaults kali-desktop-${KALI_DESKTOP} && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
EXPOSE 5900/tcp 6080/tcp
ENV DISPLAY :1
ENV KALI_DESKTOP ${KALI_DESKTOP}

ENTRYPOINT ["/init"]
ARG S6_OVERLAY_VERSION=3.1.2.1
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp/
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz && \
    rm -f /tmp/s6-overlay-x86_64.tar.xz
COPY etc/ /etc
