module API 
	class TasksController < ApplicationController
		def show
			
		end

		def index
			# @tasks = current_user.tasks
			@tasks = Task.all
			render json: @tasks, status: 200
		end

		def user

		end

		# vv this was for authorization without devise. might still be needed. vv
		# protected
		# 	def authenticate
		# 		authenticate_basic_auth || render_unauthorized
		# 	end

		# 	def authenticate_basic_auth
		# 		authenticate_with_http_basic do |username, password|
		# 			User.authenticate(username, password)
		# 		end
		# 	end

		# 	def render_unauthorized
		# 		self.headers['WWW-Authenticate'] = 'Basic realm="Tasks"'

		# 		respond_to do |format|
		# 			format.json { render json: 'Bad credentials', status: 401 }
		# 			format.html { render html: 'Bad credentials', status: 401 }
		# 			format.xml { render xml: 'Bad credentials', status: 401 }
		# 		end
		# 	end
		# end
	end
end