FROM amazonlinux

RUN yum update -y
RUN yum install -y gcc-c++ make
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install -y nodejs
RUN yum install -y python3 

RUN pip3 install aws-sam-cli
WORKDIR /tmp
COPY echo-installed-pkg /tmp/echo-installed-pkg
RUN chmod +x echo-installed-pkg && ./echo-installed-pkg
WORKDIR /



