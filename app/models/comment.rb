class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :music

  validates :text, presence: true
end
