class StudentsController < ApplicationController
  before_action :require_same_student, only: [:edit, :update]


	def index
         @students = Student.all
	end

	def new 
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			flash[:notice]= "You have sucessfully signed up"
			redirect_to root_path
		else
			render 'new'
	    end		
    end


    def show

    	@student = Student.find(params[:id])
    end

    def edit
    	@student = Student.find(params[:id])
    
    end

    def update
    	@student = Student.find(params[:id])
    	if @student.update(student_params)
    		flash[:notice]= "You have sucessfully updated your profile"
    		redirect_to student_path(@student)

    	else
    		render 'edit'
    	end

    end




    private

    def student_params
    	params.require(:student).permit(:name, :email)
    end

    def require_same_student
    	if current_user != @student
    		redirect_to student_path(current_user)
    	end
    end





end
