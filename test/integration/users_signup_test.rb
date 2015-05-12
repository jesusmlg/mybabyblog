require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  assert_no_difference 'Users.count' do
    post users_path, user:{
                          nick: 'user',
                          password: '123456',
                          password_confirmation:'654321',
                          email: 'bla@bla.com'
                          }
  end
end
