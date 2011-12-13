class UsersWidget < ActiveRecord::Base
  belongs_to :user
  belongs_to :widget
  
end
