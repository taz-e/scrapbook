require 'test_helper'

class TagsControllerTest < ActionController::TestCase

  test "should destroy tag" do
    login_as users(:paul)
    assert_difference('Tag.count', -1) do
      delete :destroy, album_id: albums(:food).to_param, photo_id: photos(:food1).to_param, id: tags(:food1_tag).to_param, format: 'json'
    end
  end
end
