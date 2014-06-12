require 'spec_helper'

describe "homepage" do 
	let(:user) { create(:user) }
	let(:user2) { create(:user, email: 'user2@test.com') }

	context 'no tasks have been added' do 
		it 'starts with no tasks' do 
			visit '/'
			expect(page).to have_content 'Sign Up'
		end
	end
	

	context 'when one task has been added' do
		
		before do
			create(:task, user: user)
        	login_as user
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

		specify 'users should be able to edit a task without leaving the homepage' do
			visit '/'
			click_on 'Homework'
			find_field('Description').value.should eq 'Science AND Maths'
			fill_in 'Title', with: 'New Homework'
			fill_in 'Description', with: 'Geography'
			click_on 'Edit Task'
			visit '/'
			expect(page).to have_content 'New Homework'
			click_on 'New Homework'
			find_field('Description').value.should eq 'Geography'
			
		end

		specify 'users should not be able to see other users tasks' do
			create(:task, user: user2, title: 'Dicking around')
			visit '/'
			expect(page).not_to have_content 'Dicking around'
		end
	end
end
