class User < ActiveRecord::Base

end

#User.create(name:"sophie").valid? # => true
#User.create(name:"sophie zhao").valid? # => false
#User.create(name: nil).valid? # => false
