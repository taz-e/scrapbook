require 'test_helper'

class PhotosControllerTest < ActionController::TestCase

  setup do
    login_as users(:michel)
  end

  test "should create photo" do
    assert_difference 'Photo.count' do
      post :create, album_id: albums(:bikes).to_param, photo: { name: 'Sample Photo', image: fixture_file_upload('attachments/plus.png') }
    end
  end

  test "should create photo with tags" do
    post :create, album_id: albums(:bikes).to_param, photo: { name: 'Test Image', image: fixture_file_upload('attachments/plus.png'), tags_attributes: [{title: 'tag1'}, {title: 'tag2'}] }
    photo = assigns[:photo]
    assert_redirected_to album_path(photo.album)
    assert_equal 2, photo.tags.count
  end

  test "should update photo" do
    @request.env['HTTP_REFERER'] = album_url(albums(:marriage))
    put :update, album_id: albums(:marriage).to_param, id: photos(:marriage2).to_param, photo: {name: 'New Name'}
    assert_redirected_to album_path(albums(:marriage))
    assert_equal 'New Name', photos(:marriage2).reload.name
  end

  test "should destroy photo" do
    @request.env['HTTP_REFERER'] = 'http://test.com/login'

    assert_difference('Photo.count', -1) do
      delete :destroy, album_id: albums(:marriage).to_param, id: photos(:marriage1).to_param
    end
  end

end
