class HomeController < ApplicationController

  before_action :auth_user!, except: [:index]

  def index
    @tasks = Task.all.order(:created_at)
  end

end

def auth_user!
  authenticate_user!
end

def resource_name
  :user
end

def resource
  @resource ||= User.new
end

def devise_mapping
  @devise_mapping ||= Devise.mappings[:user]
end
