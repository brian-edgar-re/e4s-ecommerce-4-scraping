FROM ubuntu:20.04

# Update packages
RUN apt-get update 

# Installing RVM (Ruby Version Manager)
RUN apt-get install software-properties-common -y

RUN apt-add-repository -y ppa:rael-gc/rvm
RUN apt-get update
RUN apt-get install rvm -y

# Install ruby
RUN /bin/bash -l -c "rvm install 2.4.0"
RUN /bin/bash -l -c "rvm use 2.4.0"

# Install specific bundler for ruby
RUN /bin/bash -l -c "gem install bundler:2.1.4"

# Copying ecommerce project
WORKDIR /usr/src/app
COPY ecommerce-example/ .

# Installing gems
RUN /bin/bash -l -c "bundle install"

# Run jekyll to start server
CMD ["/bin/bash", "-l", "-c", "jekyll serve --watch --host=0.0.0.0 --port=4000"]
