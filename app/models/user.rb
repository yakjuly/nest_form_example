class User < ActiveRecord::Base
  has_many :users_widgets
  has_many :widgets, :through => :users_widgets
  accepts_nested_attributes_for :users_widgets
  
end
