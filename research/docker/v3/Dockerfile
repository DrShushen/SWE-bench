# Base on nvidia cuda image: https://hub.docker.com/r/nvidia/cuda
FROM nvidia/cuda:12.2.0-runtime-ubuntu22.04

# Default to bash.
SHELL ["/bin/bash", "-c"]

# Install dependencies via apt.
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt install -y wget curl git vim nano tmux inxi htop build-essential python3-pip python3-dev openssh-server fio \
    bonnie++ sysbench rsync locales locales-all keyutils

# Enable SSH.
# See: https://www.cherryservers.com/blog/ssh-into-docker-container
# And: https://circleci.com/blog/ssh-into-docker-container/
# After running the container, you can find its IP using:
# docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_name>
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22

# Set up user:
RUN apt update && apt install -y sudo 
RUN useradd user -m -G sudo -s /bin/bash
RUN passwd -d user
USER user
RUN touch /home/user/.bashrc
RUN touch /home/user/.bash_profile
RUN mkdir /home/user/.ssh

# Conda.
# FIX TO https://repo.anaconda.com/miniconda/Miniconda3-py39_23.10.0-1-Linux-x86_64.sh
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py39_23.10.0-1-Linux-x86_64.sh -O ~/miniconda.sh && \
    bash ~/miniconda.sh -b -p ~/miniconda && \
    eval "$(~/miniconda/bin/conda shell.bash hook)" && \
    conda init && \
    source ~/.bashrc

# Make bash nicer.
RUN sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc ; \
    echo "source ~/.bashrc" > ~/.bash_profile ; \
    source ~/.bashrc

# Make tmux nicer.
# Still requires opening new terminal then Ctrl+B I then Ctrl+U to install then update plugins.
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
RUN echo $'# Tmux \n \
set -g mouse on \n \
# TPM \n \
set -g @plugin tmux-plugins/tpm \n \
set -g @plugin tmux-plugins/tmux-sensible \n \
set -g @plugin tmux-plugins/tmux-resurrect \n \
set -g @plugin tmux-plugins/tmux-continuum \n \
# Individual plugin settings: \n \
set -g @resurrect-processes watch \n \
set -g @continuum-restore on \n \
set -g @continuum-boot on \n\ 
# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf) \n \
run ~/.tmux/plugins/tpm/tpm' > ~/.tmux.conf

# --- SWE-Bench specific ---

# Prepare the conda environment.
# Get some dependencies, then install SWE-Bench in editable mode.
RUN eval "$(~/miniconda/bin/conda shell.bash hook)" && conda init && source ~/.bashrc && \
    conda install -n base python=3.9 -y && \
    conda run -n base pip install -U pip && \
    conda run -n base pip install \
        datasets tenacity anthropic openai tiktoken beautifulsoup4 chardet ghapi GitPython python-dotenv \
        requests rich "transformers>=4.34.0" tqdm

# Enable SSH.
# 1. Enable password auth on the `user` account so that SSH auth works.
RUN echo "user:mypass" | sudo chpasswd
# 2. Start SSH server using root:
USER root
CMD ["/usr/sbin/sshd", "-D"]
