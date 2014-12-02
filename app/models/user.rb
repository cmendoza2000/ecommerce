class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true, length: { minimum: 2, maximum: 15 }
  validates :email, presence: true, uniqueness: true
  validates :zip_code, allow_blank: true, length: { minimum: 5, maximum: 6 }

  has_many :articles, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
end
