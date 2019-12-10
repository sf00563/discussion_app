require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:defaultUser)
  end

  test 'valid user' do
    @user.save
    assert @user.valid?
  end

  test 'invalid without a name' do
    @user.name = nil
    refute @user.valid?, 'saved user without a name'
    assert_not_nil @user.errors[:name], 'no validation error for name present'
  end

  test 'invalid without an email' do
    @user.email = nil
    refute @user.valid?, 'saved user without a name'
  end

  test 'invalid without a password' do
    @user.encrypted_password = nil
    refute @user.valid_password?(@user.encrypted_password)
  end


end
