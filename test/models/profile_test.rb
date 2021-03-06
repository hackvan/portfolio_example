require 'test_helper'

class ProfileTest < ActiveSupport::TestCase

  def setup
    @profile = profiles(:jon)
  end

  test "should be valid" do
    assert @profile.valid?
  end

  test "name should be present" do
    @profile.name = "   "
    assert_not @profile.valid?
  end

  test "description should be present" do
    @profile.description = "   "
    assert_not @profile.valid?
  end
end
