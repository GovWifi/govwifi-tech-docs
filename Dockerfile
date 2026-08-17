FROM ruby:4.0.6-alpine

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock .ruby-version ./

RUN apk --update add g++ musl-dev make git nodejs npm yaml-dev

# RUN npm install --unsafe-perm
COPY package.json package-lock.json copy-assets.rb ./
RUN mkdir -p source/javascripts source/stylesheets
RUN npm install

RUN bundle install
COPY . .

EXPOSE 4567

# LiveReload
EXPOSE 35729

RUN bundle exec middleman build
