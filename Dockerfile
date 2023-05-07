ARG IMAGE=ubi9

FROM redhat/${IMAGE} AS dependencies

# Install dependencies
RUN yum --disableplugin=subscription-manager -y update
RUN yum --disableplugin=subscription-manager -y install wget make xz gcc libyaml-devel zlib zlib-devel
RUN yum --disableplugin=subscription-manager clean all

FROM dependencies AS builder

ARG RUBY_INSTALL_VERSION=0.9.0

# Install ruby-install
RUN wget https://github.com/postmodern/ruby-install/releases/download/v${RUBY_INSTALL_VERSION}/ruby-install-${RUBY_INSTALL_VERSION}.tar.gz
RUN tar -xzvf ruby-install-${RUBY_INSTALL_VERSION}.tar.gz
WORKDIR /ruby-install-${RUBY_INSTALL_VERSION}/
RUN make install

WORKDIR /

FROM builder AS final

ARG RUBY_BERSION=3.2

# Install Ruby
RUN ruby-install --no-install-deps --system ruby ${RUBY_BERSION}

LABEL org.opencontainers.image.source https://github.com/dashbrains/ubi-ruby
