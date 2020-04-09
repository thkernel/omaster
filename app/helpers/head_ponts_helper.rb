module HeadPontsHelper
	def head_pont_type(head_pont_type_id)
		HeadPontType.find(head_pont_type_id)
	end
end
