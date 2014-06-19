module API 
	class TasksController < ApplicationController
		skip_before_filter :verify_authenticity_token
		before_action :authenticate

		def index
			@tasks = @current_user.tasks
			# @tasks = Task.all
			render json: @tasks, status: 200
		end


		def destroy
			@user = User.find_by(email: params[:email])
			@task = Task.find(params[:id])
			if @user.id ==@task.user_id
				@task.destroy!
				render text: "Success"
			else
				render text: "Not correct user"
			end
			# puts @task.user.inspect
			# redirect_to '/'
		end

		def update
			@user = User.find_by(email: params[:email])
			@task = Task.find(params[:id])
			if @user.id ==@task.user_id
				@task.update(params[:task].permit(:title, :done, :deadline, :difficulty, :importance, :description, :category))
				render json: {status: "Success"}
			else
				render json: {status: "Not correct user"}
			end
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