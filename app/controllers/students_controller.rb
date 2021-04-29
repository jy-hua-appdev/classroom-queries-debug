class StudentsController < ApplicationController
  def index
    matching_students = Student.all

    @list_of_students = matching_students.order({ :created_at => :desc })

    render({ :template => "students/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_students = Enrollment.where({ :student_id => the_id })

    @the_student = Student.where({ :id => matching_students.at(0).student_id }).first

    render({ :template => "students/show.html.erb" })
  end
end
