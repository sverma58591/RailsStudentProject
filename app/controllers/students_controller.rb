class StudentsController < ApplicationController
    before_action :set_student, only: %i[show update edit destroy]
    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def create 
        @student = Student.new(student_params)
        if @student.save
            redirect_to @student, notice: 'Student has been created successfully'
        else 
            render :new
        end
    end

    def show 
    end

    def edit
    end

    def update
        @student.update(student_params)
        if @student.save        
        redirect_to @student, notice: 'Student has been updated successfully'
        else 
            render :edit
        end
    end

    def destroy
        @student.destroy
        redirect_to students_path, notice: 'Student has been deleted successfully'
    end 
    private
    def student_params
        params.require(:student).permit(:permanent_address, :local_address, :permanent_contact, :alternate_contact, :last_name, :first_name, :email, :date_of_birth)
    end

    def set_student
        @student = Student.find(params[:id])
    end
end
