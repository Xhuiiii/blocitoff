module UsersHelper
	def format_days_remaining(days_left)
		if days_left >= 6
			"active"
		elsif days_left >= 4
			"pending"
		else
			"urgent"
		end
	end
end
