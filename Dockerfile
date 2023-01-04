FROM ruby:3.1.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client

WORKDIR /app

COPY . .

RUN bundle install

RUN rails db:create

RUN rails db:migrate


EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
