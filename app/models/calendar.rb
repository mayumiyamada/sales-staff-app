class Calendar < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :content
    validates :hotel_name
    validates :image
end
