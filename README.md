# JsonListMiddleware
Rack middleware to wrap incoming JSON list data in an array.

## Getting Started
JsonListMiddleware is a Rack Middleware. That means that you can use it the same way that you use any other Rack middleware. For example, to use in a Sinatra application I might do this:

```ruby
require 'sinatra'
require 'json_list_middleware'

class MyApplication < Sinatra::Base
  use Rack::Session::Cookie
  use JsonListMiddleware::Middleware
end
```

For a Rails application this is handled for you automatically, just add the gem to your Gemfile.

## Installation

Add this line to your application's Gemfile:

    gem 'json_list_middleware'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install json_list_middleware

## Try it out

After you install JsonListMiddleware to your Rails application, give it a try.

In my_file.json:

```
{"object":1}
{"object":2}
{"object":3}
```

And then send the file data to your route via a POST CURL request:

	curl -X POST --header 'Content-Encoding: application/json' --data @my_file.json http://example.com/myroute

Where before you would have been greeted with an ArgumentError like:

	ActionDispatch::ParamsParser::ParseError (795: unexpected token at '{"object":1}
  {"object":2}
  '):

Now your application will recieve the data wrapped as an array!

```
[
  {"object":1},
  {"object":2},
  {"object":3}
]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
