# Url-Resolver
[![Code Climate](https://codeclimate.com/github/alexpchin/url-resolver/badges/gpa.svg)](https://codeclimate.com/github/alexpchin/url-resolver)
[![Test Coverage](https://codeclimate.com/github/alexpchin/url-resolver/badges/coverage.svg)](https://codeclimate.com/github/alexpchin/url-resolver)

## UPDATE
I've noticed from this [stackoverflow article](http://stackoverflow.com/questions/4861517/getting-the-absolute-url-when-extracting-links) that you can actually use Ruby's URI library to resolve paths:

```
absolute_uri = URI.join(page_url, href).to_s
```

This gem was created quickly as part of another project and I missed this fact.

```
require 'uri'

# The URL of the page with the links
page_url = 'http://foo.com/zee/zaw/zoom.html'

# A variety of links to test.
hrefs = %w[
  http://zork.com/             http://zork.com/#id
  http://zork.com/bar          http://zork.com/bar#id
  http://zork.com/bar/         http://zork.com/bar/#id
  http://zork.com/bar/jim.html http://zork.com/bar/jim.html#id
  /bar                         /bar#id
  /bar/                        /bar/#id
  /bar/jim.html                /bar/jim.html#id
  jim.html                     jim.html#id
  ../jim.html                  ../jim.html#id
  ../                          ../#id
  #id
]

hrefs.each do |href|
  root_href = URI.join(page_url,href).to_s
  puts "%-32s -> %s" % [ href, root_href ]
end
#=> http://zork.com/                 -> http://zork.com/
#=> http://zork.com/#id              -> http://zork.com/#id
#=> http://zork.com/bar              -> http://zork.com/bar
#=> http://zork.com/bar#id           -> http://zork.com/bar#id
#=> http://zork.com/bar/             -> http://zork.com/bar/
#=> http://zork.com/bar/#id          -> http://zork.com/bar/#id
#=> http://zork.com/bar/jim.html     -> http://zork.com/bar/jim.html
#=> http://zork.com/bar/jim.html#id  -> http://zork.com/bar/jim.html#id
#=> /bar                             -> http://foo.com/bar
#=> /bar#id                          -> http://foo.com/bar#id
#=> /bar/                            -> http://foo.com/bar/
#=> /bar/#id                         -> http://foo.com/bar/#id
#=> /bar/jim.html                    -> http://foo.com/bar/jim.html
#=> /bar/jim.html#id                 -> http://foo.com/bar/jim.html#id
#=> jim.html                         -> http://foo.com/zee/zaw/jim.html
#=> jim.html#id                      -> http://foo.com/zee/zaw/jim.html#id
#=> ../jim.html                      -> http://foo.com/zee/jim.html
#=> ../jim.html#id                   -> http://foo.com/zee/jim.html#id
#=> ../                              -> http://foo.com/zee/
#=> ../#id                           -> http://foo.com/zee/#id
#=> #id                              -> http://foo.com/zee/zaw/zoom.html#id
```

So consider this gem as deprecated.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'url-resolver'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install url-resolver

## Usage

To resolve a partial file path use:

```
UrlResolver.resolve(url, path_to_resolve)
```

## Contributing

1. Fork it ( https://github.com/alexpchin/url-resolver/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
