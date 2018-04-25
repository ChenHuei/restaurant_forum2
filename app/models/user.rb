class User < ApplicationRecord

  validates_presence_of :name
  # 確保 name 欄位為非空集合
  mount_uploader :avatar, AvatarUploader

  # 使用者「評論」很多餐廳的多對多關聯
  has_many :restaurants, through: :comments
  # 如果 User 已經有了評論，就不允許刪除帳號
  has_many :comments, dependent: :restrict_with_error
  
  # 使用者「收藏」很多餐廳的多對多關聯
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant

  # 使用者「喜歡」很多餐廳的多對多關聯
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    self.role == "admin"
  end
  
end
