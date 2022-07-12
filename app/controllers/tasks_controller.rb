class TasksController < ApplicationController
    before_action :authenticate_user! 
    before_action :set_task!
    def new
        @task = Task.new
    end

    def show
        @task = Task.find(params[:id])
    end

    def destroy
       @task =  Task.find(params[:id])
       if @task.destroy
        redirect_to root_path
       else
        flash.now[:error] = "Task couldn't destroyed"
        render "/pages/home", status: 422
       end
    end
    

    def create 
        puts "AAFDFSFSDFSD"
        @user = current_user
        @task = @user.tasks.create task_params
        if @task.save
            redirect_to root_path, notice: "post created Successfully "
        else
            render "pages/home" , status: 422
        end
    end

    def update
        @task = Task.find(params[:id])
        


        if @task.update_attribute(:completed, !@task.completed)
          redirect_to root_path
        else
          flash[:error] = "Something went wrong"
          puts "EERRRRROOORR"
          redirect_to root_path, status: 422
        end
    end

    def edit
        @task = Task.find(params[:id])
    end
    

    def update_two
        @task = Task.find(params[:id])
        
        print task_params
        print "AADSFAFSDFSDFSDF"
        print task_params

        if @task.update(task_params)
          flash[:success] = "Object was successfully updated"
          redirect_to show_task_path(@task)
        else
          flash[:error] = "Something went wrong"
          puts "EERRRRROOORR"
          render :edit , status: 422
        end
    end
    
    
    def new
        @task = Task.new
        
    end
    
    
    private
    # def set_task
    #     @task = Task.new
    #     @tasks = Task.all
    #   end
    

    def task_params
        params.require(:task).permit(:content)
    end


end
