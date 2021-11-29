FROM ruby:2.4.2

COPY ./docker/start.sh /start.sh
RUN chmod 777 /start.sh

WORKDIR /app
COPY . /app/
RUN bundle install

EXPOSE 9292/tcp

CMD ["/start.sh"]
