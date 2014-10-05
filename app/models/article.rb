class Article < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { minimum: 4, maximum: 15 }
  validates :category, presence: true
  validates :price, presence: true
end
