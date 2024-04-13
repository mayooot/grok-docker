FROM ccr.ccs.tencentyun.com/autodl-private-cloud/miniconda:cuda11.8-cudnn8-devel-ubuntu22.04-py310

LABEL mainatiner=https://github.com/mayooot/grok-docker.git

RUN sed -i '/source \/etc\/autodl-motd/d' ~/.bashrc

WORKDIR /root

COPY run.py .
RUN git clone https://github.com/xai-org/grok-1.git
RUN mv run.py grok-1/run.py

RUN cd grok-1 && \
    /root/miniconda3/bin/pip install -r requirements.txt && \
    /root/miniconda3/bin/pip install --upgrade jax jaxlib && \
    /root/miniconda3/bin/pip install --upgrade "jax[cuda12_pip]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html