install:
	bundle install
	yarn install
lint:
	bundle exec rubocop && bundle exec slim-lint app/views
test:
	NODE_ENV=test bin/rails test
env:
	cp -n .env.example .env
deploy:
	git push heroku main

.PHONY: test
