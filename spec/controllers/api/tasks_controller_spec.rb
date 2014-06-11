require 'spec_helper'

describe API::TasksController do

	before(:each) do
		create(:task)
	end

	it "displays the task" do
		get :index
		expect(response.body).to include('Homework')
	end

end
