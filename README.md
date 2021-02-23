# Twitter for cars

> A ruby on rails social media app where users can sign up, follow one another,
> and post tweets.

## Screenshot

![App screenshot](/public/images/screenshot.png)

## Table of contents

- [Live demo](#live-demo)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Getting started](#getting-started)
- [Story time](#story-time)
- [Run tests](#run-tests)
- [Deployment](#deployment)
- [Authors](#authors)
- [Contributing](#contributing)
- [Show your support](#show-your-support)

## Live demo

Visit this [link](https://twitter-for-cars.herokuapp.com/)

## Features

- User can sign-in and sign-up
- User can post tweets
- User can follow one another
- User can like tweets
- User can see their stats (no. of tweets, followers, followings)

## Prerequisites

- Ruby: 2.7.2
- Rails: 6.1.1
- Postgres: >=9.5

## Getting Started

- Clone the repo `https://github.com/abeidahmed/ror-social-scaffold.git`
- `cd` into the project
- Run `git pull origin main`
- Run `bundle install`
- Run `yarn install` to install all the npm dependencies
- Setup your `db` in the `database.yml` and run `rails db:setup`
- Run `rails s` and visit `localhost:3000`

## Story time

While working on this project, I had the necessity to use svg icons, especially
the one designed by Steve Schoger called [heroicons](https://heroicons.com/).
And to my surprise, there weren't any ruby gems that provided the functionality
and the simplicity that I wanted.

So I decided to publish a ruby gem. At first, I implemented all the core logic
and the tests within this project itself, and after that I extracted the feature
and bundled up into a gem. The gem is called [rails_heroicon](https://github.com/abeidahmed/rails-heroicon).

Feel free to use it in your `rails` project.

## Run tests

- Run `bundle exec rspec` to run all the tests, or
- Run `bundle exec guard` to start the guard server. The tests run when the test
  files are saved.

## Deployment

This project is hosted on heroku.

- `heroku apps:create your_site_name`
- `heroku buildpacks:add heroku/nodejs --index 1`
- `heroku buildpacks:add heroku/ruby --index 2`
- `git push heroku main`

> You do not need to run the `rails s` or `migrate` the `db`. The `Procfile`
> located in the root directory automatically does this for you. Feel free to
> add more commands such as `sidekiq` if you are running one.

## Authors

### Abeid Ahmed

- GitHub: [@abeidahmed](https://github.com/abeidahmed)
- Twitter: [@iamhawaabi](https://twitter.com/iamhawaabi)
- LinkedIn: [Abeid Ahmed](https://www.linkedin.com/in/abeidahmed/)

## Contributing

- Fork the project
- Create your feature branch `git checkout -b awesome-feature`
- Commit your changes `git commit -m 'Awesome feature'`
- Push it `git push -u origin awesome-feature`
- Open a pull request using this branch

## Show your support

Give a ⭐️ if you like this project!
