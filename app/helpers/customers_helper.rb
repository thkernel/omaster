module CustomersHelper
	def customer_type(customer_type_id)
		CustomerType.find(customer_type_id)
	end
end
