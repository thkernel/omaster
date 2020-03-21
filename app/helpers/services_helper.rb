module ServicesHelper

    def service_name(id)
        if id.present?
            Service.find(id).name
        end
    end


end
