# Civo Ruby API Library

This project is the Ruby API library for using in Rails projects.

## Command-Line Interface

If you are wanting to use the [Civo command line interface](https://github.com/civo/cli), that's a separate project. However, as a brief quickstart, all you need to do is [install it](http://rubygems.org/gems/civo_cli), configure it with the token supplied when you signed up for your Civo account and you're ready to go:

```sh
gem install civo_cli
civo tokens:save default my_api_key_from_api_dot_civo_dot_com_goes_here
```

## API Library

To use the library in your own Rails (or Sinatra, etc) projects you can just add it to the Gemfile:

```ruby
gem 'civo'
```

Install the gem:

```sh
bundle install
```

You need to define in an intializer, Heroku config or `.env` file `ENV["CIVO_TOKEN"]` and `ENV["CIVO_URL"]` and these will be picked up by the classes.

Then you can use classes like this:

```ruby
size = Civo::Size.all.first
region = Civo::Region.all.first.code
template = Civo::Template.all.first.id
Civo::SshKey.create(name: "default", public_key: File.read("~/.ssh/id_dsa.pub"))

instance = Civo::Instance.create(hostname: "text.example.com", size: size, region: region,
  template: template, public_ip: true, ssh_key: "default")
```

The API library consists of a handful of [Flexirest](https://github.com/andyjeffries/flexirest) classes that implement the Civo API. There is full documentation on the API available at https://api.civo.com/.

## API Version 1

If you are hitting an old legacy v1 API (i.e. not running against api.civo.com), you'd need to make the following changes:

1. Set `ENV["CIVO_API_VERSION"]` to be `1` in your initializer
2. While legacy tokens are usable in v1 API servers at the moment, in the future this will change to be an administrator API key and secret.  More to follow...
