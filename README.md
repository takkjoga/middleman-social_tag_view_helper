# Middleman::SocialTagViewHelper

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/middleman/social_tag_view_helper`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'middleman-social_tag_view_helper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-social_tag_view_helper

## Usage

### Configration

```ruby
activate :social_tag_view_helper
set :facebook_app_id, 'facebook app id'
```

### View file

into head tag
```ruby
  = facebook_app_id_meta_tag
  = open_graph_meta_tag(page_title: "Title", page_image: "http://example.com/image.png")
```

into layout file
```ruby
= facebook_like_button  # require
= hatena_bookmark_button
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/takkjoga/middleman-social_tag_view_helper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

