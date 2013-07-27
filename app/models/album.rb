class Album < ActiveRecord::Base

  # Define attributes here
  attr_accessible :name, :photos_attributes

  # Define Associations here
  belongs_to :user
  has_many :photos, dependent: :destroy

  # For Nested Forms
  accepts_nested_attributes_for :photos, reject_if: proc{|p| p[:image].blank?}

end
