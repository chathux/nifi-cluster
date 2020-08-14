FROM centos:7.4.1708
LABEL maintainer="udaya.chathuranga@thealtria.com"

RUN yum -y install sudo
RUN yum -y install yum-utils
RUN yum -y install java-1.8.0-openjdk

ENV NIFI_BASE_DIR=/opt/
ENV NIFI_HOME_DIR=/opt/nifi/

ENV ZK_BASE_DIR=/opt/
ENV ZK_HOME_DIR=/opt/zookeeper/

#Use copy from host_dir to reduce download times
COPY local_media/nifi-1.10.0-bin.tar.gz ${NIFI_BASE_DIR}/nifi-bin.tar.gz
#RUN curl -f https://archive.apache.org/dist/nifi/1.10.0/nifi-1.10.0-bin.tar.gz -o ${NIFI_BASE_DIR}/nifi-bin.tar.gz
RUN tar -xzf ${NIFI_BASE_DIR}/nifi-bin.tar.gz -C ${NIFI_BASE_DIR}
RUN ln -s ${NIFI_BASE_DIR}/nifi-1.10.0 ${NIFI_BASE_DIR}/nifi

#third party libraries for asn
ENV OSLICDIR=/nifi_data/files/asn1lic/

#config nifi
COPY nifi-node3/conf/* ${NIFI_HOME_DIR}/conf/

#copy start script
#COPY start.sh ${NIFI_BASE_DIR}/

#start services
CMD ["/opt/nifi/bin/nifi.sh", "run"]