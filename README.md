![Build Status](https://travis-ci.org/mmb/rspec_stubout.png)](https://travis-ci.org/mmb/rspec_stubout)
[![Code Climate](https://codeclimate.com/github/mmb/rspec_stubout.png)](https://codeclimate.com/github/mmb/rspec_stubout)

Make your RSpec specs fail when you stub the object under test (subject) because it is bad practice.

In your spec_helper.rb:

```ruby
require 'rspec_stubout/prevent_stubout'

RSpec.configure do |config|
  RspecStubout.prevent_stubout(config)
end
```

To turn it off for some examples, allowing them to stub subject:

```ruby

it 'stubs subject', allow_stubout: true do
  subject.stub(method1: 'foo')
end
```
