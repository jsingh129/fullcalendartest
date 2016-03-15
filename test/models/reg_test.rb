require 'test_helper'

class RegTest < ActiveSupport::TestCase
  test "successful registration" do
    register_with email: 'liz@mcnamara-troy.com',password: '1234567',

    assert page.has_no_css?('.error')
	  assert User.fetch('liz@mcnamara-troy.com')
    assert User.fetch('liz')
end

  test "failed registration (no password)" do
    register_with email: 'liz@mcnamara-troy.com',

    assert page.has_content?(t('errors.is_not_present'))
    assert User.all.empty?
  end

  test "failed registration (duplicate email)" do
    register_with email: 'liz@mcnamara-troy.com',
      password: '1234567',


    visit '/logout'

    register_with email: 'liz@mcnamara-troy.com',
      password: '1234567',

    assert page.has_content?(t('errors.is_already_taken'))

    assert User.fetch('liz@mcnamara-troy.com')
    assert ! User.fetch('quentin@mcnamara-troy.com')
  end

    test "failed registration (password too short)" do
    register_with email: 'liz@mcnamara-troy.com',
      password: '123',

    assert User.all.empty?
  end