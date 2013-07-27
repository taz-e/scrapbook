class Tag < ActiveRecord::Base

  # Define attributes here
  attr_accessible :title

  # Define Associations Here
  belongs_to :photo

end
