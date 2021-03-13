FROM ruby:2.7.1-buster AS build
COPY . /app
WORKDIR /app
RUN bundle install \
    && bundle exec jekyll build 

FROM nginxinc/nginx-unprivileged AS final
COPY --from=build /app/_site /usr/share/nginx/html