FROM      tensorflow/tensorflow

ENV TF_TYPE "cpu"
ENV TARGET_DIRECTORY '/usr/local'

RUN add-apt-repository -y ppa:longsleep/golang-backports &&\
     apt-get update &&\
      apt-get -y install \
      		git  \
		curl \
		golang-go

RUN  curl -L  "https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-${TF_TYPE}-$(go env GOOS)-x86_64-1.1.0.tar.gz" | tar -C $TARGET_DIRECTORY -xz

RUN ldconfig &&\
      go get github.com/tensorflow/tensorflow/tensorflow/go
