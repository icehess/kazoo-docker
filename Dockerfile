FROM erlang:19.3

ENV DEBIAN_FRONTEND=noninteractive
ENV APT_LISTCHANGES_FRONTEND=none

RUN apt-get update -y
RUN apt-get install -y \
	vim emacs-nox wget curl ca-certificates sed git-core tcpdump zip unzip \
	net-tools python tmux silversearcher-ag ntpdate colordiff bash-completion

RUN apt-get install -qq -y \
	build-essential expat htmldoc libexpat1-dev libssl-dev libncurses5-dev libxslt-dev zlib1g-dev

RUN apt-get install -qq -y sox libsox-fmt-all ghostscript

WORKDIR "/opt/kazoo"

COPY entrypoint /
RUN chmod +x /entrypoint

ENTRYPOINT ["/entrypoint"]
CMD ["scripts/dev-start-apps.sh"]
