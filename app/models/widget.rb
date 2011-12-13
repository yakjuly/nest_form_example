class Widget < ActiveRecord::Base
  has_many :users_widgets
  has_many :users, :through => :users_widgets
end
