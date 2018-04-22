class User < ApplicationRecord

  validates_presence_of :name
  # 確保 name 欄位為非空集合
  mount_uploader :avatar, AvatarUploader
  has_many :comments
  has_many :restaurants, through: :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    self.role == "admin"
  end
  
end
