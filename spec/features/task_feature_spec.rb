require 'spec_helper'

describe 'Tasks' do

  it 'shows a form for new tasks' do

    visit '/tasks/new'
    expect(page).to have_field('Title')

  end

  it 'can add a task to the database' do

    visit 'tasks/new'
    fill_in 'Title', with: 'Homework'
    fill_in 'Deadline', with: "2014-06-05"
    fill_in 'Difficulty', with: "5"
    fill_in 'Importance', with: "6"
    click_button "Create Task"

    expect(current_path).to eq '/'
    expect(Task.all.count).to eq 1
    expect(Task.all.last.difficulty).to eq 5
    expect(Task.all.last.importance).to eq 6
  end

  context 'with a task added' do
    before do
      task = create(:task)

    end
    it 'starts off uncompleted' do
      visit '/'
      checkbox = find("input[type='checkbox']")
      expect(checkbox).should_not be_checked
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
