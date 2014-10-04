class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true
  validates :zip_code, length: { minimum: 5, maximum: 6 }

end
