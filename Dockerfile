# ベースとなるイメージを指定
FROM ruby:2.7.4

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Yarn のインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# 作業ディレクトリを設定
RUN mkdir /myapp
WORKDIR /myapp

# ホストの Gemfile をコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Bundler をインストールし、Gem をインストール
RUN gem install bundler:2.2.29
RUN bundle install

# ホストのプロジェクトフォルダをコピー
COPY . /myapp

# サーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]
