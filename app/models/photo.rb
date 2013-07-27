class Photo < ActiveRecord::Base
  attr_accessible :name, :image, :tags_attributes

  # Define Associations here
  belongs_to :album
  has_many :tags, dependent: :destroy
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300#", thumb: "100x100>" }
  
  accepts_nested_attributes_for :tags, reject_if: proc{|p| p[:title].blank?}
end
