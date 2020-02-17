FROM amazonlinux

RUN yum update -y
RUN yum install -y gcc-c++ make
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install -y nodejs python3 unzip
RUN pip3 install aws-sam-cli
WORKDIR /tmp
# RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
COPY echo-installed-pkg /tmp/echo-installed-pkg
RUN chmod +x echo-installed-pkg && ./echo-installed-pkg
WORKDIR /



