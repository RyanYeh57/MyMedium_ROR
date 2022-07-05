class Comment < ApplicationRecord
  acts_as_paranoid

  # validations
  validates :content, presence: true

  # relationship
  belongs_to :user
  belongs_to :story
end
