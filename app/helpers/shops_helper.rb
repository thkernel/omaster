module ShopsHelper
	def locality(locality_id)
		Locality.find(locality_id)
	end

end
