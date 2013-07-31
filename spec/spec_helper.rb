# encoding: UTF-8

require 'rspec_stubout/prevent_stubout'

RSpec.configure do |config|
  RspecStubout.prevent_stubout(config)
end
