# Keepnote Application

# docker run -d \
#	-v /tmp/.X11-unix:/tmp/.X11-unix \
#	-e DISPLAY=unix$DISPLAY \
#	--name keepnote \
#	madhuakula/keepnote

FROM debian:stretch
LABEL maintainer "Madhu Akula <madhu.akula@hotmail.com>"

RUN apt-get update && apt-get install -y \
	keepnote \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENV HOME /home/keepnote
RUN useradd --create-home --home-dir $HOME keepnote \
	&& chown -R keepnote:keepnote $HOME

WORKDIR $HOME
USER keepnote

ENTRYPOINT [ "keepnote" ]
