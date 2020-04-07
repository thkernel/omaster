module LocalitiesHelper
	def city(city_id)
		City.find(city_id)
	end
end
