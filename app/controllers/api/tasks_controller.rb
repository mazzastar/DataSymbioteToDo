module API 
	class TasksController < ApplicationController
		
		before_action :authenticate

		def index
			@tasks = @current_user.tasks
			# @tasks = Task.all
			render json: @tasks, status: 200
		end


		def destroy
			@task = Task.find(params[:id])
			@task.destroy!
			redirect_to '/'
		end

		private
			def authenticate 
				if params[:token] != Rails.application.secrets.secret_api_key 
					render text: "Incorrect Token Provided" 
				else
					@current_user=User.find_by(email: params[:email])
					render text: "No user" if @current_user.nil?
				end
			end
	end
end