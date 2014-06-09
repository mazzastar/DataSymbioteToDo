require 'spec_helper'

describe "homepage" do 

	it 'shows the home page' do 
		visit '/'
		expect(page).to have_content "Hello World!"
	end




end