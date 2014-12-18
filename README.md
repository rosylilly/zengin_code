# ZenginCode

[![Gem Version](https://badge.fury.io/rb/zengin_code.svg)](http://badge.fury.io/rb/zengin_code)

bank codes and branch codes for japanese.

## Installation

Available on:

- [rubygems](https://rubygems.org/gems/zengin_code)

You need zengin code on another language? [Please request to me](https://github.com/rosylilly/zengin_code/issues).

## Usage

### Ruby

```ruby
require 'zengin_code'

ZenginCode::Bank.all => { '00001' => <#ZenginCode::Bank code, name, kana, hira, roma ... >, .... }
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/zengin_code/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
