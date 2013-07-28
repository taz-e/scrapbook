class Tag < ActiveRecord::Base

  # Define attributes here
  attr_accessible :title

  # Define Associations Here
  belongs_to :photo

  #Define Validations Here
  validates :title, presence: true

end
