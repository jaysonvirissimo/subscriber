# Subscriber

Take in a shopping basket, and return receipt details including sales tax and import duties.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add subscriber

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install subscriber

## Usage

After installing locally using `bin/setup`, open the console with `bin/console`.
Put a multiline string between `Subscribe[]` like the following:
```
Subscriber[
<<~HEREDOC
  1 imported box of chocolates at 10.00
  1 imported bottle of perfume at 47.50
HEREDOC
]
```
It'll print out the receipt details like so:
```
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jaysonvirissimo/subscriber.
