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

  test "email should be unique" do
    duplicate_email = @user.dup
    duplicate_email.email = @user.email.upcase
    @user.save

    assert_not duplicate_email.valid?
  end

  test "nick should be unique" do
    duplicate_nick = @user.dup
    duplicate_nick.nick = @user.nick.upcase
    @user.save

    assert_not duplicate_nick.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "JeSuS@ExamPlE.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

end
