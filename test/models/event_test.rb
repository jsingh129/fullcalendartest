require 'test_helper'

class EventTest < ActiveSupport::TestCase
	test "save a event " do 
		event = Event.new(:title => "TestCase", :description => "hello")
        event.save
        assert_equal 1, Event.count
	end
		
	test "should have a title" do
		event = Event.new(:title => nil)
		assert !Event.vaild?,"should have an error"
    end

	test "should have a description" do
		event = Event.new(:description => nil)
		assert !Event.vaild?,"should have an error"
    end

    test "should have a starttime" do
		event = Event.new(:start_time => nil)
		assert !Event.vaild?,"should have an error"
    end

    test "should have a end time" do
		event = Event.new(:end_time => nil)
		assert !Event.vaild?,"should have an error"
    end

    test "title should be longer than 3 characters" do
    	event = Event.new(:title => "aa")
    	assert !Event.vaild?
    end
end


