require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user =  User.new(name: "user1", nick:"user1_nick", password: "123456", password_confirmation: "123456", email: "hola@hola.com")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "    "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 256
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email should be valid format" do
    valid_emails = %w[jesus@jesus.com JESUS@jesus.com hola.hola@hola.com jesus@hola.hola.com]

    valid_emails.each do |ve|
      @user.email = ve
      assert @user.valid? , "#{ve.inspect} should be valid"
    end
  end
end
