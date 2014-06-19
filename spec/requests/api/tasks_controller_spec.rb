require 'spec_helper'

describe API::TasksController, :type => :api do

	before(:each) do
		@user1 = create(:user, email: "userNew@user.com")
		@user2 = create(:user)
		@secret = "secret"
		create(:task, user: @user2)
	end

	it "displays incorrect token" do
		get '/api/tasks'
		expect(response.body).to include('Incorrect Token Provided')
	end

	it "displays no user" do 
		get '/api/tasks?token=secret'
		expect(response.body).to include('No user')
	end

	it "displays the correct Task" do 
		url_string = "/api/tasks?token=#{@secret}&email=#{@user2.email}"
		get url_string
		expect(response).not_to be_nil

		expect(response.body).to include('Homework')
	end

	it "displays No task if a user has no tasks" do 
		url_string = "/api/tasks?token=#{@secret}&email=#{@user1.email}"
		get url_string
		expect(response.body).to eq "[]"
	end

	context "deleting a task via the api" do 
		before(:each) do 
			@new_task = create(:task, title: "TEST_TITLE", user: @user2)
			@url_string = "/api/tasks/#{@new_task.id}"
		end

		 it "should not delete a task if no token details have been provided" do 
		 	@url_string = "/api/tasks/#{@new_task.id}"
		 	delete @url_string
			get "/api/tasks?token=#{@secret}&email=#{@user2.email}"
			expect(response.body).to include('TEST_TITLE')
		 end
		
		 it "should not delete a task if no email details have been provided" do 
		 	@url_string = @url_string+"?token=#{@secret}"
		 	delete @url_string
			get "/api/tasks?token=#{@secret}&email=#{@user2.email}"
			expect(response.body).to include('TEST_TITLE')
		 end

		 it "should not delete a task if it is a different user email details have been provided" do 
		 	@url_string = @url_string + "?token=#{@secret}&email=#{@user1.email}"
		 	delete @url_string
			get "/api/tasks?token=#{@secret}&email=#{@user2.email}"
			expect(response.body).to include('TEST_TITLE')
		 end

		it "deletes a task if both the correct " do 
			get "/api/tasks?token=#{@secret}&email=#{@user2.email}"
			expect(response.body).to include('TEST_TITLE')

			@url_string = @url_string + "?token=#{@secret}&email=#{@user2.email}"
			delete @url_string
			get "/api/tasks?token=#{@secret}&email=#{@user2.email}"
			expect(response.body).not_to include('TEST_TITLE')
		end
	end


	context "updating a task via the api" do 
		before(:each) do 
			@new_task = create(:task, title: "TEST_TITLE", user: @user2)
		end

		it "should update a task if both the correct token and email are  supplied" do 
			expect(@new_task.done).to eq false
			put "/api/tasks/#{@new_task.id}?token=#{@secret}&email=#{@user2.email}", { task: { done: true } }
			expect(@new_task.reload.done).to eq true
		end


	end

end
