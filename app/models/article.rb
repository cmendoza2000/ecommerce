class Article < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { minimum: 4, maximum: 15 }
  validates :category, presence: true
  validates :price, presence: true

  has_many :questions, dependent: :destroy

  belongs_to :user

  before_save :create_slug

  def create_slug
    self.slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')  
  end
end
