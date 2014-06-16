class Task < ActiveRecord::Base

	belongs_to :user
	include TasksHelper

	before_create :set_deadline_to_time

	def set_deadline_to_time
		self.deadline = read_attribute(:deadline) || Time.now
	end
end
