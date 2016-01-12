# FancyFeed

![FancyFeed](http://cdn0.rubylane.com/shops/1089582/MCGP1514.1L.jpg)

## Feasting on Feeds

SeeMore is a student project of students in the 4th cohort of Ada Developers Academy. Team FancyFeed includes: [Ricky Hougland](https://github.com/hougland), [Jenna Nichols] (https://github.com/jennaplusplus), [Daphne Gold](https://github.com/daphnegold), and [Kelley Devlin](https://github.com/Kedevlin).

To view original project requirements, [click here](https://github.com/Ada-C4/seemore/blob/fancyfeed/master/README.md).

A **feed** is an API that a web service uses to provide users with frequently updated content. A *feed aggregator*  is an application that acts as a central location for reviewing the content of feeds. It **injests** feeds and stores their content in its own datastore after transforming it into a standard format.

FancyFeed is a feed aggregator service that allows users to login via Twitter or Vimeo. Once logged in, a user can search for and subscribe to Vimeo and Twitter handles. FancyFeed pulls those handles' updates together into one aggregated feed on the homepage.

## Configuration
- ruby version
- fork, clone, bundle install
- rake db:migrate, rake db:seed (though it works best if you log in as developer and add feeds manually)
- log in using oauth developer strategy

### Technical Requirements
#### Authentication
  - Allows Users to sign in and out using [OmniAuth's Developer Strategy](http://rubydoc.info/github/intridea/omniauth/master/OmniAuth/Strategies/Developer) in development only. This should not be enabled for Production (a.k.a. Heroku deployment)
  - Allows Users to sign-up and login with at least two social media accounts (Instagram, Twitter, Vimeo, Github)

#### Functionality
  - A user can view all subscribed feeds on one page in chronological order
  - Save each social media post to the local database, duplicates should not be allowed

#### Testing
  - 95% Test Coverage

#### Look & Feel
  - Visually appealing and polished

### Baseline
- Each team shall submit a baseline Pull Request with their Rails application created, ruby version, ruby gemset and gemfile updated with default gems
- This PR shall be merged with the baseline setup prior to any other code being pushed to the branch/fork

### Final Submission
- Deployed to Heroku and link included in the Pull Request and README
- No major bugs
- Minor bugs noted as Github issues

### Added Fun!
  - Automatically pulls in Twitter timeline feed for the authenticated user
  - Automatically pulls in Instagram timeline feed for the authenticated user
  - Use any additional APIs not in your chosen two for authentication or feed aggregation
  - Use **cron** to periodically update feeds without duplication
  - Allow Users to share favorite stories back to social media services
