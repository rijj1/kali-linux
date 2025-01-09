# Use Kali Linux base image
FROM kalilinux/kali-rolling

# Install XFCE Desktop, VNC Server, and web tools
RUN apt update && apt install -y \
    xfce4 kali-linux-default tightvncserver novnc websockify \
    && apt clean

# Create a non-root user for Gitpod compatibility
RUN useradd -m gitpod && chown -R gitpod:gitpod /workspace
USER gitpod
