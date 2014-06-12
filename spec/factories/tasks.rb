# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
  	title "Homework"
  	deadline "2014-06-05"
  	difficulty 5
  	importance 6
  	description "Science AND Maths"
  	category 5
  end
end
