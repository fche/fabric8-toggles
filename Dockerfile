FROM centos:7
LABEL maintainer="Aslak Knutsen <aslak@redhat.com>"

ENV F8_USER_NAME=fabric8
RUN useradd  -s /bin/bash ${F8_USER_NAME}

RUN yum install -y epel-release && yum install -y nodejs && yum clean all 

WORKDIR /home/${F8_USER_NAME}
COPY package.json .
RUN npm install --production

COPY . .

RUN chmod -R +777 /home/${F8_USER_NAME}
USER ${F8_USER_NAME}

EXPOSE 8080

CMD node index.js