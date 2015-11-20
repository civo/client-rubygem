# Civo CLI and Ruby API Library

This project includes both the command line utility and the Ruby API library for using in Rails projects (these may be split in the future, but for now they are unified).

There is a documentation available on each command using:

```sh
civo help
```

You can get help on a subcommand by running:

```sh
civo help sshkeys
```

## Quickstart

To use the Civo command line interface, all you need to do is install it, configure it with the token supplied when you signed up for your Civo account and you're ready to go:

```sh
gem install civo
civo tokens:save default ohsoijfdosjfoieu983y98u39h89h9ion98yh9
```

If you have multiple accounts you can choose to add more than one token and switch the default around as required:

```sh
civo tokens:save other sij0fjweiojfesnifds980jopnkjbjkn
civo tokens:default other
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

instance = Civo::Instance.create(hostname: "text.example.com", size: size, region: region, template: template, public_ip: true, ssh_key: "default")
```

The API library consists of a handful of [Flexirest](https://github.com/andyjeffries/flexirest) classes that implement the Civo API. There is full documentation on the API available at https://api.civo.com/doc/.