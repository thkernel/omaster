module SubHeadPontsHelper

	def sub_head_pont_type(sub_head_pont_type_id)
		SubHeadPontType.find(sub_head_pont_type_id)
	end
end
