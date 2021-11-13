FROM lballabio/boost:focal as dev
# Add and configure required tools
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y python python3-pip unzip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN pip install jupyter ipywidgets jupyter_dashboards pythreejs bqplot matplotlib scipy
RUN jupyter dashboards quick-setup --sys-prefix
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
ENV LC_NUMERIC C
WORKDIR /home/jovyan
ENV HOME /home/jovyan
ENV PATH ${HOME}/script:${HOME}/.local/bin:${HOME}/bin:${HOME}/sbin:/opt/conda/bin:${HOME}/miniconda/bin:${PATH}
FROM dev as prod

