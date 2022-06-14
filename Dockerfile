FROM ruby:3.0.3-alpine

RUN apk --update --upgrade add build-base ruby-dev zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev

WORKDIR /seQura

ENV BUNDLE_PATH /gems

COPY Gemfile* .
RUN bundle install

COPY . ./

EXPOSE 5000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
