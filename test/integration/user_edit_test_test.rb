require 'test_helper'

class UserEditTestTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:jesus)
  end

  test "unsuccessful edit" do
    # log_in(@user)
    # get edit_user_path(@user)
    # assert_template 'users/edit'
    # patch user_path(@user), user: { name:  "",
    #                                 email: "foo@invalid",
    #                                 nick:  "af",
    #                                 password:              "foo",
    #                                 password_confirmation: "bar" }
    # assert_template 'users/edit'
  end

end
