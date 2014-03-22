# PreCommit::Checkstyle

[![Build Status](https://travis-ci.org/secondrotation/pre-commit-checkstyle.svg?branch=master)](https://travis-ci.org/secondrotation/pre-commit-checkstyle)

[Checkstyle](http://checkstyle.sourceforge.net/) linter plugin for [pre-commit](https://github.com/jish/pre-commit). Useful for linting Java code.

## Installation

Add this line to your application's Gemfile:

    gem 'pre-commit-checkstyle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pre-commit-checkstyle

## Usage

Make sure the gem is installed and setup the check in [pre-commit](https://github.com/jish/pre-commit) with:

``` bash
pre-commit enable git checks checkstyle
```

OR

``` bash
pre-commit enable yaml checks checkstyle
```

## Contributing

1. Fork it ( http://github.com/secondrotation/pre-commit-checkstyle/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
