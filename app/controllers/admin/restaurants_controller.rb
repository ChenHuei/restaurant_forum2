class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  # 我們先確保使用者有登入，才能拿到 User instance
  # 進而去驗證 instance 身上攜帶的 role 屬性，是否帶有 "admin" 的值

  def index
    @restaurants = Restaurant.all
  end
end
