FROM centos:centos7

ADD Python-3.8.5.tar.xz /tmp

RUN yum-builddep python -y && \
   yum install -y kudu kudu-master kudu-tserver kudu-client0 kudu-client-devel python-devel make && \
   cd /tmp/Python-3.8.5 && \
   ./configure && make && make install && \
   cd .. && rm -rf Python-3.8.5 && \
   rm /usr/bin/python && ln -s /usr/local/bin/python3 /usr/bin/python && \
   python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip && \
   yum update -y

