class Photo < ActiveRecord::Base
  attr_accessible :name, :image

  # Define Associations here
  belongs_to :albums
  has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100>" }
end
