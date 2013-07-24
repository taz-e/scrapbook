class Album < ActiveRecord::Base

  # Define attributes here
  attr_accessible :name

  # Define Associations here
  belongs_to :user
end
