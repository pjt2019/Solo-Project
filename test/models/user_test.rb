require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the user fixture" do
    u = User.find_by_email('test@test.com')
    assert u
  end
end
