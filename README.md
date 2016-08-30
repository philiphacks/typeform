# Typeform

Typeform is a Ruby gem that provides a wrapper for interacting with the Typeform Data API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'typeform'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install typeform

## Usage

Please refer to the [Typeform Data API Documentation](https://www.typeform.com/help/data-api/) for more information about the API, or follow the examples below:

```ruby
require 'typeform'

Typeform.api_key = ENV['TYPEFORM_API_KEY']
typeform_id = "an_id_here"
form = Typeform::Form.new(typeform_id)

all_entries = form.all_entries
incomplete_entries = form.incomplete_entries
complete_entries = form.complete_entries

# Fetches all complete entries since today
newest_entries = form.complete_entries(since: Date.today.to_time.to_i)
```

For now, the wrapper returns the default format as returned by the Typeform Data API. I have some thoughts on how they should structure their data and how they can be build a [Hypermedia APIs](http://en.wikipedia.org/wiki/Hypermedia), but the current implementation allows you to build your custom logic on top of the responses (e.g. your pagination logic).

## Contributing

1. Fork it ( https://github.com/philipdesmedt/typeform/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
