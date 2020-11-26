# frozen_string_literal: true

class Music < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  mount_uploader :file, AudiofileUploader

  with_options presence: true do
    validates :file
    validates :artist
    validates :title
  end
end
