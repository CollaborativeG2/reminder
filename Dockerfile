FROM ruby:3.1.3

ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_LOG_TO_STDOUT=true
ARG MASTER_KEY
ENV RAILS_MASTER_KEY=${MASTER_KEY}

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt update -y && apt -y install libpq-dev

## nodejs
#RUN curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
#RUN sudo apt-get update && sudo apt-get install -y nodejs
#
## yarn
#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#RUN sudo apt-get update && apt-get install yarn

WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle config set --local deployment 'true' && \
    bundle config set --local without 'development test' && \
    bundle install
ADD . /myapp

RUN bundle exec rake assets:precompile

EXPOSE 8080
CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "8080"]
