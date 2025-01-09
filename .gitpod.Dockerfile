# Use Kali Linux base image
FROM kalilinux/kali-rolling

# Set DEBIAN_FRONTEND to non-interactive mode to avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install XFCE Desktop, Kali tools, and VNC Server
RUN apt update && apt install -y \
    xfce4 \
    kali-linux-default \
    tightvncserver \
    novnc \
    websockify \
    && apt clean

# Fix any issues with dpkg/console setup that may arise
RUN dpkg-reconfigure console-setup

# Clean up
RUN rm -rf /var/lib/apt/lists/*

# Create the Gitpod user with GID 33333 and UID 33333
RUN groupadd -g 33333 gitpod && \
    useradd -m -u 33333 -g gitpod gitpod

# Optional: Create /workspace directory if it doesn't exist
RUN mkdir -p /workspace && chown -R gitpod:gitpod /workspace

# Switch to gitpod user
USER gitpod
