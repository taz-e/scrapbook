require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase

  setup do
    login_as users(:paul)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:albums)
    assert_template 'index'
  end

  test "new" do
    get :new
    assert_response :success
    assert_template 'new'
  end

  test 'should get show' do
    get :show, id: albums(:food).to_param
    assert_response :success
    assert_template 'show'
  end

  test "should create album" do
    assert_difference 'Album.count' do
      post :create, album: { name: 'Sample Album' }
    end
  end

  test "should create album with photos and tags" do
    post :create, album: { name: 'Test Album', photos_attributes: [{image: fixture_file_upload('attachments/plus.png'), name: 'Photo1', tags_attributes: [{title: 'tag1'}, {title: 'tag2'}]},
                                                                    {image: fixture_file_upload('attachments/plus.png'), name: 'Photo2', tags_attributes: [{title: 'tag3'}, {title: 'tag4'}]}]}
    @album = assigns[:album]
    assert_redirected_to album_path(@album)
    assert_equal 2, @album.photos.count
    assert_equal 4, @album.photos.map{|p| p.tags}.flatten.count
  end

  test "should update album" do
    @request.env['HTTP_REFERER'] = albums_url
    put :update, id: albums(:cars).to_param, album: {name: 'New Name'}
    assert_redirected_to albums_path
    assert_equal 'New Name', albums(:cars).reload.name
  end

  test "should destroy album" do
    @request.env['HTTP_REFERER'] = 'http://test.com/login'

    assert_difference('Album.count', -1) do
      delete :destroy, id: albums(:food).to_param
    end
  end

end
