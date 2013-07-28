require 'test_helper'

class TagTest < ActiveSupport::TestCase

  test "should create tag" do
    assert_difference 'Tag.count' do
      photos(:bikes1).tags.create(title: "Nice Wedding")
    end
  end

  test "should associated to photo" do
    assert_kind_of Photo, tags(:food2_tag).photo
  end

  test "should not create without title" do
    t = photos(:food1).tags.new
    assert !t.save
    assert t.errors.messages.include?(:title)
  end
end
