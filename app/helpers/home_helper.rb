module HomeHelper
	CATEGORIES_ICONS = {1=>'',2=> '', 3=>'', 4=>' ', 5=>'', 6=>'', 7=>'', 8=>'', 9=>'', 10=>''}
	CATEGORIES_NAMES = {1=>'Heart',2=> 'Film', 3=>'Drinks', 4=>'Concert', 5=>'Home', 6=>'School', 7=>'Office', 8=>'Travel', 9=>'Correspondence', 10=>'Private'}	

	def icon_and_name(number)
		CATEGORIES_ICONS[number] + "-" + CATEGORIES_NAMES[number]
	end

	def icon(number)
		CATEGORIES_ICONS[number]
	end

	def name(number)
		CATEGORIES_NAMES[number]
	end
end
