FROM ubuntu

RUN apt-get update && apt-get install -y ruby-full build-essential zlib1g-dev
RUN echo '# Install Ruby Gems to ~/gems' >> /root/.bashrc
RUN echo 'export GEM_HOME="$HOME/gems"' >> /root/.bashrc
RUN echo 'export PATH="$HOME/gems/bin:$PATH"' >> /root/.bashrc

RUN gem install jekyll bundler
ADD ./Gemfile /home/Gemfile
RUN cd /home && bundle
EXPOSE 4000

