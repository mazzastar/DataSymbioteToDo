require_relative '../app/helpers/TimeLeft'

describe "TimeCalculations" do 
	include TimeCalculations
	# let(:dummyClass){Class.new{include TimeCalculations}}
	let(:time_now){Time.new(2007,11,3)}
	let(:time_start){Time.new(2007,11,1)}
	let(:time_deadline){Time.new(2007,11,9)}


	before(:each) do 
		Time.stub(:now).and_return(time_now)
	end
	
	it "produces a difference of two days" do
		days = 2 	
		expect(timeDiff(time_start, Time.now)).to eq days*60*60*24
	end

	it "calculates the time used so far" do 
		days = 2
		expect(timeUsed(time_start)).to eq days*60*60*24
	end

	it "calculates the % of time used rounded to 10%" do 
		expect(timeUsedPercentage(time_deadline, time_start)).to eq(30)
	end
end