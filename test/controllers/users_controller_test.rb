require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should get aboutme" do
    get :aboutme
    assert_response :success
    assert_select "title", "Historias de una mamá prematura"
  end
end
