FROM ruby:2.5.1

RUN apt-get update -qq && apt-get install -y build-essential #libmysqlclient-dev #nodejs tzdata

RUN gem install bundler

#RUN gem install jekyll

WORKDIR /popac

ADD Gemfile Gemfile.lock /popac/

RUN bundle install
