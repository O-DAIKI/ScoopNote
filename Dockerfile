FROM ruby:2.6.5
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    yarn
WORKDIR /ScoopNote
COPY Gemfile Gemfile.lock /ScoopNote/
RUN gem install bundler:2.1.4
RUN bundle install

COPY . /ScoopNote
