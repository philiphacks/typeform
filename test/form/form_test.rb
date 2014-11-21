require './test/test_helper'

class TypeformFormTest < Minitest::Test
  def setup
    Typeform.api_key = ENV["TYPEFORM_API_KEY"]
  end

  def test_exists
    assert Typeform::Form
  end

  def test_it_gives_back_a_single_form
    VCR.use_cassette('one_form') do
      form = Typeform::Form.new(ENV["TYPEFORM_ID"])
      assert_equal Typeform::Form, form.class

      entries = form.all_entries
      assert_equal 200, entries.http_status
      assert entries.questions.kind_of?(Array)
    end
  end
end
