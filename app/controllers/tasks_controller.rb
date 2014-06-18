class TasksController < ApplicationController

	# before_action :auth_user!


	def new
		@task = Task.new
	end

	def create
		@task = current_user.tasks.create!(params[:task].permit(:title, :deadline, :difficulty, :importance, :description, :category))
		@task.save!
		respond_to do |format|
			format.html{redirect_to '/'}
			format.json{render json: @task}
		end
		
	end

	def edit
		@task = Task.find(params[:id])
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy!
		redirect_to '/'
	end

	def update
		@task = Task.find(params[:id])
		
		if @task.update_attributes(params[:task].permit(:title, :done, :deadline, :difficulty, :importance, :description, :category))
			if request.xhr?
				render json: @task
			else
				redirect_to '/'
			end
		end
		puts params.inspect
	end

end
