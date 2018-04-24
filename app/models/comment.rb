class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  validates :body, presence: true
end
