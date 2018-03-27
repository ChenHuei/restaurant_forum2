class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  # 我們先確保使用者有登入，才能拿到 User instance
  # 進而去驗證 instance 身上攜帶的 role 屬性，是否帶有 "admin" 的值
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "restaurant was successfully created."
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "restaurant was failed to create."
      render :new
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = "restaurant was succeddfully updated."
      redirect_to admin_restaurants_path(@restaurant)
    else
      flash.now[:alert] = "restaurant was failed to update."
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
    flash[:alert] = "restaurant was deleted."
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description, :image)
    # 加上 require(:photo) 可以幫我們確認使用者上傳的參數名為 photo，以防邏輯出錯
    # 透過 permit(:name, :opening_hours, :tel, :address, :description) 
    # 過濾餐廳名字、營業時間等資料，主要是為了防止有人傳入不相干的惡意資訊。這是一個 Rails 內建的安全性功能，稱為 strong parameters。
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end


end
