require 'spec_helper'

describe API::TasksController do

	before(:each) do
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
		expect(response.body).to include('Homework')
	end

end
