class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_many :answers, dependent: :destroy
end
