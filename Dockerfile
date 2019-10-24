FROM nvcr.io/nvidia/pytorch:19.09-py3
MAINTAINER yourname
 
# environment install
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN apt-get update
RUN apt-get -y install sudo
RUN apt-get -y install curl
RUN apt-get -y install openssh-client
RUN apt-get -y install openssh-server
RUN apt-get -y install vim

# set root login
RUN echo "root:passwd123" | chpasswd
RUN sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config  
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config  
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config 

 
 
# port expose
EXPOSE 22 6006 8888

ADD utils.tar /root/


#python requirement list
RUN pip install numpy
RUN pip install opencv-python

 
 
ENTRYPOINT ["/root/utils/entrypoint.sh"]
