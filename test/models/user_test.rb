require 'test_helper'


class UserTest < ActiveSupport::TestCase
  test "a user should enter a name" do
    user = User.new
    assert !user.save
    assert !user.errors[:name].empty?
  end


  test "a user should have a unique profile name" do
    user = User.new
    user.name = users(:jason).name
    assert !user.save
    assert !user.errors[:name].empty?
  end

  test "a user should have a name without spaces" do
    user = User.new(first_name: 'Jason', last_name: 'Seifer', email: 'jason2@teamtreehouse.com')
    user.password = user.password_confirmation = 'asdfasdf'
    user.profile_name = "My Profile With Spaces"

    assert !user.save
    assert !user.errors[:name].empty?
    assert user.errors[:name].include?("Must be formatted correctly.")
  end

  test "a user should have a unique email" do
  	user = User.new
  	user.email = user(:Jason).email
  	assert !user.save
  	assert !user.errors[:email].empty?
  end
  test 'successful login' do
    assert_equal :name,@User.name
    assert_content page, 'Log in'
    click_button('Submit')
    assert_content page, 'Signed in successfully'
  end
end



