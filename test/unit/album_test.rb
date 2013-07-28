require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test 'should create album' do
    assert_difference 'Album.count' do
      Album.create(name: 'Test Album')
    end
  end

  test 'should accepts nested attributes for photos' do
    a = Album.new(name: 'Test Album', photos_attributes: [{image: sample_file, name: 'Photo1'}, {image: sample_file('JetInOurRoom.jpg'), name: 'Photo2'}])
    assert a.valid?
    assert a.save
    assert_equal 2, a.photos.count
  end

  test 'can create album, photos and tags in single call' do
    a = Album.new(name: 'Test Album', photos_attributes: [{image: sample_file, name: 'Photo1', tags_attributes: [{title: 'tag1'}, {title: 'tag2'}]},
                                                          {image: sample_file, name: 'Photo2', tags_attributes: [{title: 'tag3'}, {title: 'tag4'}]}])
    assert a.valid?
    assert a.save
    assert_equal 2, a.photos.count
    assert_equal 4, a.photos.map{|p| p.tags}.flatten.count
  end

  test 'should reject tags with empty image' do
    a = Album.create(name: 'Test Album', photos_attributes: [{image: sample_file, name: 'Photo1'}, {name: 'Photo2'}])
    assert_equal 1, a.photos.count
  end

  test "should associated to user" do
    assert_kind_of User, albums(:food).user
  end

  test "should associated to photos" do
    assert albums(:cars).photos.include?(photos :cars1)
  end
end
