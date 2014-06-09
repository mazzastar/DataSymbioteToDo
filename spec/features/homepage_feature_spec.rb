require 'spec_helper'

describe "homepage" do 

	context 'no tasks have been added' do 
		it 'starts with no tasks' do 
			visit '/'
			expect(page).to have_content 'No tasks yet!'
		end
	end

end