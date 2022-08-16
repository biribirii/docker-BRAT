
FROM httpd

RUN \
    apt-get clean && \
    apt-get update && \
    apt-get install -y \
        ca-certificates \
        python \
        wget \
	apache2

RUN \
    cd htdocs && \
    wget https://github.com/biribirii/BRAT/raw/main/brat-v1.3_Crunchy_Frog.tar.gz && \
    tar -xvzf *.tar.gz && \
    rm *.tar.gz && \
    mv brat*/ brat/

ADD httpd.conf /usr/local/apache2/conf/
ADD install.sh /usr/local/apache2/htdocs/brat/

RUN /usr/local/apache2/htdocs/brat/install.sh bcc92 clearbrat123! bcc92@uw.edu
