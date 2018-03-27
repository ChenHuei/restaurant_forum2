class AddImageToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :image, :string
    # 順序傳入資料表名稱、欄位名稱、和欄位的資料型態
    # 注意資料表名稱是複數
  end
end
