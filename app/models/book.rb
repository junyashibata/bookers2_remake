class Book < ApplicationRecord
  
  has_one_attached :image
   validates :title, presence: true
  validates :body, length: { minimum: 1, maximum: 200 }
  
  belongs_to :user
end
