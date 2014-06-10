class TasksController < ApplicationController

	def new
		@task = Task.new
	end

	def create
		@task = Task.create!(params[:task].permit(:title, :deadline, :difficulty, :importance))
		@task.save!
		redirect_to '/'
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
		puts params.inspect
		if @task.update_attributes(params[:task].permit(:title, :done, :deadline, :difficulty, :importance))
			# redirect_to'/'
			if request.xhr?
				render json: { success: true }
			else
				redirect_to '/'
			end
		end
	end

end
