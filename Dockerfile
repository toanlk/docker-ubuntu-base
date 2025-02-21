# Base image: Ubuntu 22.04
FROM ubuntu:22.04

# Set environment to non-interactive to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Ho_Chi_Minh \
    LANG='en_US.UTF-8' \
    LANGUAGE='en_US:en' \
    LC_ALL='en_US.UTF-8' \
    USER=root

# Install necessary system dependencies in a single layer
RUN apt-get update && apt-get install -y --no-install-recommends \
    supervisor \
    xfce4 \
    xfce4-terminal \
    unzip nano zip curl git wget \
    iputils-ping net-tools telnet xvfb \
    htop software-properties-common lsb-release sudo supervisor mousepad locales tzdata

RUN apt-get install -y \
    xfonts-100dpi xfonts-75dpi \
    tigervnc-common tigervnc-standalone-server

# Install Python 3.10 and pip
RUN apt-get install -y python3.10 python3-pip

# Ensure python3.10 is the default
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && locale-gen en_US.UTF-8 \
    && dpkg-reconfigure locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/*