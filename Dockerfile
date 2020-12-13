FROM ruby:2.6.5
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && mkdir ScoopNote
WORKDIR /ScoopNote
COPY Gemfile /ScoopNote/Gemfile
COPY Gemfile.lock /ScoopNote/Gemfile.lock
RUN gem install bundler && bundle install 