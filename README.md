# ZenginCode

[![Gem Version](https://badge.fury.io/rb/zengin_code.svg)](http://badge.fury.io/rb/zengin_code)
[![npm version](https://badge.fury.io/js/zengin-code.svg)](http://badge.fury.io/js/zengin-code)
[![Bower version](https://badge.fury.io/bo/zengin-code.svg)](http://badge.fury.io/bo/zengin-code)

bank codes and branch codes for japanese.

## Installation

Available on:

- [rubygems](https://rubygems.org/gems/zengin_code) : `gem install zengin_code`
- [npm](https://www.npmjs.com/package/zengin-code) : `npm install zengin-code`
- [Bower](http://bower.io/) : `bower install zengin-code`

You need zengin code on another language? [Please request to me](https://github.com/rosylilly/zengin_code/issues).

## Usage

### Ruby

```ruby
require 'zengin_code'

ZenginCode::Bank.all => { '00001' => <#ZenginCode::Bank code, name, kana, hira, roma ... >, .... }
```

### Javascript

```javascript
var zenginCode = require('zengin-code');

zenginCode; // => { '0001': { 'name': ..., 'kana': ..., 'branches': [ ... ] } }
```

## Contributing

1. Fork it ( https://github.com/rosylilly/zengin_code/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
