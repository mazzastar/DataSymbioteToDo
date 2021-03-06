module TimeCalculations

	def timeDiff(timeStart, timeEnd)
		timeEnd-timeStart
	end

	def timeUsed(start)
		Time.now-start
	end

	def timeUsedPercentage(deadline, start)
		(timeUsed(start)/timeDiff(start, deadline)).round(1)*100
	end

end