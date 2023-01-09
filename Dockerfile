FROM ruby:3.1.3

ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_LOG_TO_STDOUT=true
ARG MASTER_KEY
ENV RAILS_MASTER_KEY=${MASTER_KEY}

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt update -y && apt -y install libpq-dev

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
