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
end
