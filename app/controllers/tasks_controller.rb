class TasksController < ApplicationController

	def new
		@task = Task.new
	end

	def create
		@task = Task.create!(params[:task].permit(:title, :deadline, :difficulty, :importance))
		@task.save!
		redirect_to '/'
	end

end
