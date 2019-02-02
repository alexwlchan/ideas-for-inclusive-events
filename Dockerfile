FROM ruby:2.4-alpine3.6

LABEL maintainer "Alex Chan <alex@alexwlchan.net>"
LABEL description "Build image for alexwlchan.net/inclusive-events"

COPY Gemfile .
COPY Gemfile.lock .

RUN apk add --update build-base
RUN bundle install

VOLUME ["/site"]
WORKDIR /site

ENTRYPOINT ["bundle", "exec", "jekyll"]
