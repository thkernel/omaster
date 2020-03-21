module RegisterTypesHelper
    def register_type(id)
        RegisterType.find(id)
    end
end
