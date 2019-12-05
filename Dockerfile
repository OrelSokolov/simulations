FROM ruby:2.6.3-stretch

ENV RAILS_ENV production
ENV RAILS_MASTER_KEY ae47734a2cfd6f7c84eebcbf5b4083ef
ENV DATABASE_HOST postgres-math
ENV DATABASE_PORT 5432
ENV DATABASE_USERNAME sims
ENV DATABASE_PASSWORD asdf
ENV REDIS_URL redis://localhost:6379/1

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - 
RUN apt install -y nodejs 

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update 
RUN apt install yarn

COPY . /application
WORKDIR /application
RUN bundle install 
RUN bundle exec rake assets:precompile

ENTRYPOINT ./entrypoint.sh

