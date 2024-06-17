FROM ruby:3.0

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

WORKDIR /app

RUN gem install bundler

# COPY Gemfile Gemfile.lock ./
# RUN bundle install

COPY . .

RUN bundle install

# RUN bundle exec rake db:drop
# RUN bundle exec rake db:migrate
# RUN bundle exec rake db:seed

ARG DEFAULT_PORT 7078

EXPOSE ${DEFAULT_PORT}

# CMD ["./run-server.sh"]
CMD [ "bundle","exec", "puma", "config.ru"]
