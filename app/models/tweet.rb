class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  validates :content
  validates :hotel_name
  validates :image
  end
end

