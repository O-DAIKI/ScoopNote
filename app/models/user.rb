# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :default_image

  has_many :musics
  has_one_attached :image
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :favorite_musics, through: :favorites, source: :music

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  validates :nickname, presence: true

  validate :image_content_type, if: :was_attached?

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def self.guest
    find_or_create_by!(email: "guest@example.com", nickname: "ゲスト") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.search(search)
    if search != ""
      User.where("nickname LIKE(?)", "%#{search}%")
    else
      User.all
    end
  end

  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "l_e_others_501.png")), filename: "default-image.png", content_type: "image/png")
    end
  end

  def image_content_type
    extension = ['image/png', 'image/jpg', 'image/jpeg']
    errors.add(:image, "の拡張子が間違っています") unless image.content_type.in?(extension)
  end

  def was_attached?
    self.image.attached?
  end

end
