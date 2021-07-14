FROM ruby:3.0.2

WORKDIR /app
COPY . .

RUN bundle install
EXPOSE 3000

CMD ["/app/app.sh"]
