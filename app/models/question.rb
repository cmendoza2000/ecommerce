class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_one :answer, dependent: :destroy
end
