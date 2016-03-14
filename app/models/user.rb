class User < ActiveRecord::Base
	validates :name, presence: true
	validates :passward, length: { is: 2 }
end

User.create(name:"sophie").valid? # => true
User.create(name:"sophie zhao").valid? # => false
User.create(name: nil).valid? # => false
