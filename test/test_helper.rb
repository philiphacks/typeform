require './lib/typeform'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.filter_sensitive_data("<TYPEFORM_API_KEY>") { Typeform::Typeform.api_key }
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
end
