class ApplicationController < ActionController::Base
    
    protected 
    def set_task!
        @task = Task.new
        @tasks = Task.all
    end
    
end
