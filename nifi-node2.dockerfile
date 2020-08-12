FROM centos:7.4.1708
LABEL maintainer="udaya.chathuranga@thealtria.com"

RUN yum -y install sudo
RUN yum -y install yum-utils
RUN yum -y install java-1.8.0-openjdk

ENV NIFI_BASE_DIR=/opt/
ENV NIFI_HOME_DIR=/opt/nifi/

ENV ZK_BASE_DIR=/opt/
ENV ZK_HOME_DIR=/opt/zookeeper/

# RUN groupadd nifi \
#     && useradd --shell /bin/bash -g nifi -m nifi
# RUN mkdir -p ${NIFI_BASE_DIR}
# RUN chown nifi:nifi ${NIFI_BASE_DIR}

# USER nifi

#Use copy from host_dir to reduce download times
COPY local_media/nifi-1.10.0-bin.tar.gz ${NIFI_BASE_DIR}/nifi-bin.tar.gz
#RUN curl -f https://archive.apache.org/dist/nifi/1.10.0/nifi-1.10.0-bin.tar.gz -o ${NIFI_BASE_DIR}/nifi-bin.tar.gz
RUN tar -xzf ${NIFI_BASE_DIR}/nifi-bin.tar.gz -C ${NIFI_BASE_DIR}
RUN ln -s ${NIFI_BASE_DIR}/nifi-1.10.0 ${NIFI_BASE_DIR}/nifi

COPY local_media/apache-zookeeper-3.5.6-bin.tar.gz ${ZK_BASE_DIR}/apache-zookeeper.tar.gz
#RUN curl -f http://archive.apache.org/dist/zookeeper/zookeeper-3.5.6/apache-zookeeper-3.5.6-bin.tar.gz -o ${ZK_BASE_DIR}/apache-zookeeper.tar.gz
RUN tar -xzf ${ZK_BASE_DIR}/apache-zookeeper.tar.gz -C ${ZK_BASE_DIR}
RUN ln -s ${ZK_BASE_DIR}/apache-zookeeper-3.5.6-bin ${ZK_BASE_DIR}/zookeeper


#config zookeeper
COPY nifi-node2/zk/conf/zoo.cfg ${ZK_HOME_DIR}/conf/

#config nifi
COPY nifi-node2/conf/* ${NIFI_HOME_DIR}/conf/

#copy start script
COPY start.sh ${NIFI_BASE_DIR}/

#start services
CMD ["/opt/start.sh"]