require 'test_helper'

class PhotoTest < ActiveSupport::TestCase

  test 'should create photo' do
    assert_difference 'Photo.count' do
      Photo.create(image: sample_file, name: 'Test Image')
    end
  end

  test 'should accepts nested attributes for tags' do
    p = Photo.new(name: 'Test Image', image: sample_file, tags_attributes: [{title: 'tag1'}, {title: 'tag2'}])
    assert p.valid?
    assert p.save
    assert_equal 2, p.tags.count
  end

  test 'should reject tags with empty title' do
    p = Photo.create(name: 'Test Image', image: sample_file, tags_attributes: [{title: ''}, {title: 'tag2'}])
    assert_equal 1, p.tags.count
  end

  test "should associated to album" do
    assert_kind_of Album, photos(:food2).album
  end

  test "should associated to tags" do
    assert photos(:cars1).tags.include?(tags :cars1_tag)
  end
end
