module TaskStatusesHelper

    def task_status(id)
        TaskStatus.find(id)
    end
end
