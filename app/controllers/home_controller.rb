class HomeController < ApplicationController
  before_action :auth_user!, except: [:index]
  include TasksHelper

  def index
  	if user_signed_in?
    	@tasks = current_user.tasks.all.order(:created_at)
	else
		@tasks = nil
	end
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

def completed_tasks

end

def incompleted_tasks

end