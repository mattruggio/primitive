# Primitive

[![Gem Version](https://badge.fury.io/rb/primitive.svg)](https://badge.fury.io/rb/primitive) [![CI](https://github.com/mattruggio/primitive/actions/workflows/ci.yaml/badge.svg)](https://github.com/mattruggio/primitive/actions/workflows/ci.yaml) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This library contains the most root objects I found myself re-implementing over and over. It is meant to serve as an abstract base for object modeling a domain.

### Installation

To install through Rubygems:

```zsh
gem install primitive
```

You can also add this to your Gemfile using:

```zsh
bundle add primitive
```

### Primitive::Entity

Base class for objects identified by a string value (ID). Extension example:

```ruby
class Team < Primitive::Entity
  attr_reader :name

  def initialize(id:, name:)
    super(id)

    @name = name
  end
end
```

Several features are now provided by its base-class via the ID attribute:

* Case-insensitive equality: `#eql?` and `#==`
* Object hashing: `#hash`
* Sorting: `#<=>`
* Outputting: `#to_s`

## Contributing

### Development Environment Configuration

Basic steps to take to get this repository compiling:

1. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/) (check primitive.gemspec for versions supported)
2. Install bundler (gem install bundler)
3. Clone the repository (git clone git@github.com:mattruggio/primitive.git)
4. Navigate to the root folder (cd primitive)
5. Install dependencies (bundle)

### Running Tests

To execute the test suite run:

```zsh
bin/rspec spec --format documentation
```

Alternatively, you can have Guard watch for changes:

```zsh
bin/guard
```

Also, do not forget to run Rubocop:

```zsh
bin/rubocop
```

And auditing the dependencies:

```zsh
bin/bundler-audit check --update
```

And Sorbet:

```zsh
bin/srb
```

### Publishing

Note: ensure you have proper authorization before trying to publish new versions.

After code changes have successfully gone through the Pull Request review process then the following steps should be followed for publishing new versions:

1. Merge Pull Request into main
2. Update `version.rb` using [semantic versioning](https://semver.org/)
3. Install dependencies: `bundle`
4. Update `CHANGELOG.md` with release notes
5. Commit & push main to remote and ensure CI builds main successfully
6. Run `bin/rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Code of Conduct

Everyone interacting in this codebase, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mattruggio/primitive/blob/main/CODE_OF_CONDUCT.md).

## License

This project is MIT Licensed.
