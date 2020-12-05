# frozen_string_literal: true

class Music < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy

  mount_uploader :file, AudiofileUploader

  with_options presence: true do
    validates :file
    validates :artist
    validates :title
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search != ""
      Music.where('title LIKE(?)', "%#{search}%")
    else
      Music.all
    end
  end
end
