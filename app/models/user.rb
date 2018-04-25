class User < ApplicationRecord

  validates_presence_of :name
  # 確保 name 欄位為非空集合
  mount_uploader :avatar, AvatarUploader
  # 如果 User 已經有了評論，就不允許刪除帳號
  has_many :comments, dependent: :restrict_with_error
  has_many :restaurants, through: :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    self.role == "admin"
  end
  
end
