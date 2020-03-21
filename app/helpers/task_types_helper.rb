module TaskTypesHelper
    def task_type(id)
        TaskType.find(id)
    end
end
