class Admin::CategoriesController < ApplicationController
  before_action :authenticate_uesr!
  before_action :authenticate_admin
end
