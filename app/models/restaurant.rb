class Restaurant < ApplicationRecord
  belongs_to :category
  mount_uploader :image, PhotoUploader
  # 屬性名稱的型態是 symbol，而 uploader 的名稱型態為 constant
  #（因為 PhotoUploader 也是一個 Class）
  validates_presence_of :name
end
