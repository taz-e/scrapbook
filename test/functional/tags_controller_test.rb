require 'test_helper'

class TagsControllerTest < ActionController::TestCase

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete :destroy, id: tags(:food1_tag).to_param
    end
  end
end
