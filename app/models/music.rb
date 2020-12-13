# frozen_string_literal: true

class Music < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :favorites, dependent: :destroy

  mount_uploader :file, AudiofileUploader

  with_options presence: true do
    validates :file
    validates :artist
    validates :title
  end

  validate :image_content_type, if: :image_was_attached?

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search != ""
      Music.where("title LIKE(?)", "%#{search}%")
    else
      Music.includes(:user).order(created_at: :desc)
    end
  end

  before_create :default_image

  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "l_e_others_501.png")), filename: "default-image.png", content_type: "image/png")
    end
  end

  def image_content_type
    extension = ["image/png", "image/jpg", "image/jpeg"]
    errors.add(:image, "の拡張子が間違っています") unless image.content_type.in?(extension)
  end

  def image_was_attached?
    self.image.attached?
  end
end
