FROM amazonlinux:latest

RUN yum install -y gcc-c++ make && \
    curl -sL https://rpm.nodesource.com/setup_10.x | bash - && \
    yum install -y nodejs mysql-devel python-devel python-pip python3 tar gzip unzip && \
    yum clean all && \
    rm -rf /var/cache/yum

COPY aws-cli.pub /root/

# aws cli
RUN curl -s -o /root/awscliv2.zip https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip && \
    curl -s -o /root/awscliv2.sig https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip.sig && \
    gpg --import /root/aws-cli.pub && \
    gpg --verify /root/awscliv2.sig /root/awscliv2.zip && \
    unzip -q -d /root/ /root/awscliv2.zip && \
    /root/aws/install

# aws sam cli
RUN pip3 install aws-sam-cli

COPY docker-entrypoint.sh /usr/local/bin

VOLUME /root/.aws

ENTRYPOINT ["docker-entrypoint.sh"]