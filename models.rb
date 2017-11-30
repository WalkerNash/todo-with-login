class User < ActiveRecord::Base
  has_many :lists
end

class List < ActiveRecord::Base
  belongs_to :user
end
