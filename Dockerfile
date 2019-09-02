FROM ubuntu:18.04
MAINTAINER Paco Bahena (pbahena72@gmail.com)

ENV AIRFLOW_HOME=/root/home/conf
RUN apt-get update
RUN apt-get install \
	libmysqlclient-dev \
	mysql-server \
	python3-dev \
	python3-pip \
	git-core \
	zsh \
	curl \
	vim \
	jq \
	apt-utils \
	wget -y
RUN pip3 install apache-airflow[s3,mysql,postgres,slack,password,crypto] && \
	pip3 install Flask==1.0.4
RUN pip3 install awscli
RUN echo "export PATH=/root/.local/bin:$PATH" >> .bashrc
WORKDIR /root/home/conf
RUN ls
EXPOSE 8080
ENTRYPOINT ["/root/home/conf/entrypoint.sh"]
CMD webserver
