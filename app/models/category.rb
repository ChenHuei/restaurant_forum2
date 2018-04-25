class Category < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  
  # 如果分類下已有餐廳，就不允許刪除分類
  has_many :restaurants
end
