# class API::TasksController < ApplicationController

# 	def show
# 	end
# end

module API 
	class TasksController < ApplicationController
		def show
			
		end

		def index
			@tasks = Task.all
			render json: @tasks, status: 200
		end
	end
end