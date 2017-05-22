FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /Picture
WORKDIR /Picture
ADD Gemfile /Picture/Gemfile
ADD Gemfile.lock /Picture/Gemfile.lock
RUN bundle install
ADD . /Picture