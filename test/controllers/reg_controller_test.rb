require 'test_helper'

class RegControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  
  def should_get_new 
  	assert true
  end
end
