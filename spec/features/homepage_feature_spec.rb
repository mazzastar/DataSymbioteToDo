require 'spec_helper'

describe "homepage" do 

	context 'no tasks have been added' do 
		it 'starts with no tasks' do 
			visit '/'
			expect(page).to have_content 'No tasks yet!'
		end
	end

	context 'when one task has been added' do
		
		before do
			task = create(:task)
		end

		it 'displays the taks on the homepage' do
			visit '/'
			expect(page).to have_content 'Homework'
		end

		specify 'users should be able to edit tasks' do
			visit'/'
			click_on 'Edit'
			find_field('Title').value.should eq 'Homework'
			expect(page).to have_field('Title')
			
		end


		specify 'users should be able to delete tasks' do
			visit'/'
			click_on 'Delete'
			expect(page).not_to have_content('Homework')
		end

	end
end