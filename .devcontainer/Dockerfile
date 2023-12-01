FROM ghcr.io/uw-ece699-design/turtlebot4:latest

# set up an unprivileged user
RUN adduser --gecos "" --disabled-password robohub
RUN echo "robohub   ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/docker
# source bashrc fragments from repo
RUN /bin/echo -e "source /opt/robohub/humble/setup.bash\nFRAGMENTS=\$(find /workspaces/ -maxdepth 2 -type f -name .bashrc)\nif [ ! -z "\${FRAGMENTS}" ]; then\n   source \${FRAGMENTS}\nfi" >> /home/robohub/.bashrc
# persistent bash_history
RUN /bin/echo -e 'export HISTFILE=$(find /workspaces/ -mindepth 1 -maxdepth 1 -type d -not -name ".*" | head -n1)/.bash_history\nshopt -s histappend\nexport PROMPT_COMMAND="history -a;$PROMPT_COMMAND"' >> /home/robohub/.bashrc

# initialize rosdep
RUN cp -r /root/.ros /home/robohub && chown -R robohub:robohub /home/robohub/.ros


