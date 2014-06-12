require 'spec_helper'

describe 'Tasks' do
  let(:user) { create(:user) }

  it 'shows a form for new tasks' do

  	login_as user

    visit '/tasks/new'
    expect(page).to have_field('Title')
    expect(page).to have_field('Deadline')
    expect(page).to have_field('Difficulty')
    expect(page).to have_field('Importance')
    expect(page).to have_field('Description')
    expect(page).to have_field('Category')
    expect(page).to have_button('Create Task')



  end

  it 'can add a task to the database with correct fields' do

  	login_as user

    visit 'tasks/new'
    fill_in 'Title', with: 'Homework'
    fill_in 'Deadline', with: "2014-06-05"
    fill_in 'Difficulty', with: "5"
    fill_in 'Importance', with: "6"
    fill_in 'Description', with: "Science AND maths"
    fill_in 'Category', with: "5"
    click_button "Create Task"

    expect(current_path).to eq '/'
    expect(Task.all.count).to eq 1
    expect(Task.all.last.difficulty).to eq 5
    expect(Task.all.last.importance).to eq 6
    expect(Task.all.last.category).to eq 5
  end

  context 'with a task added' do
    before do
      task = create(:task, user: user)
      login_as user
    end
    it 'starts off uncompleted' do
      visit '/'
      checkbox = find("input[type='checkbox']")
      expect(checkbox).not_to be_checked
    end

    it 'should stay checked if the user has checked it', js: true do
    	visit '/'
    	checkbox = find("input[type='checkbox']")
    	checkbox.set(true)
    	checkbox.should be_checked
    	sleep 2
    	visit '/'
    	checkbox = find("input[type='checkbox']")
    	checkbox.should be_checked
    end
  end
end
