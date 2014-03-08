Trell
=====

[![Gem Version](https://badge.fury.io/rb/trell.png)][gem]
[![Build Status](https://secure.travis-ci.org/linyows/trell.png?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/linyows/trell.png?travis)][gemnasium]
[![Code Climate](https://codeclimate.com/github/linyows/trell.png)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/linyows/trell/badge.png?branch=master)][coveralls]

[gem]: https://rubygems.org/gems/trell
[travis]: http://travis-ci.org/linyows/trell
[gemnasium]: https://gemnasium.com/linyows/trell
[codeclimate]: https://codeclimate.com/github/linyows/trell
[coveralls]: https://coveralls.io/r/linyows/trell

Simple Ruby wrapper for <img src="https://d2k1ftgv7pobq7.cloudfront.net/images/bd87ee916375920ae72dffadbb10d412/logo-blue-lg.png" width="70">API. API documentation: https://trello.com/docs/api

Installation
------------

Add this line to your application's Gemfile:

```ruby
gem 'trell'
```

Or install it yourself as:

```sh
$ gem install trell
```

Usage
-----

Reading public data

```ruby
member = Trell.member 'foo'
member.fullName
=> #<Sawyer::Resource:0x007f971230f538
```

Authentication
--------------

Generate a application key and application token

```ruby
`open #{Trell.key_generator}` #=> get application key
`open #{Trell.token_generator}` #=> get application token

Trell.configure do |c|
  c.application_key = '429452e37b7eb23182ec12**********'
  c.application_token = '1cf2e7a22edf6ad8e967aa31a60947dc9ad2e0bf90d5********************'
end
```
Reading private data

```ruby
member = Trell.member 'me'
=> "invalid token\n"
member = Trell.member 'me'
=> #<Sawyer::Resource:0x007fdf537f07d0
member.fullName
=> "my full name"
member.bio
=> ""
member.idBoards
=> ["4e79823242c330ede8*****",
 "518b1a7f47e4c61d310*****",
  "5313d1b1239bbeb31a1*****"]
member = Trell.update_member 'me', bio: 'hi'
=> #<Sawyer::Resource:0x007fcca26189f8
member.bio
=> "hi"
```

Contributing
------------

1. Fork it ( http://github.com/linyows/trell/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Authors
-------

- [linyows](https://github.com/linyows)

License
-------

The MIT License (MIT)
