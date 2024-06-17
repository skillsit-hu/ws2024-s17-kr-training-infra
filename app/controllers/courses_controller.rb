class CoursesController < ApplicationController
  before_action :authorized, except: %i[ index show ]
  before_action :set_course, only: %i[ update publish destroy ]

  def index
    @courses = Course.state :published

    render json: @courses
  end

  def mine
    @courses = current_user.courses

    render json: @courses
  end

  def show
    @course = Course.find_by slug: params[:id]
    if @course
      render json: @course, include: [lessons: {methods: [:course_name, :time_slot]}]
    else
      render json: {
        message: 'Not found'
      }, status: :not_found
    end
  end

  def publish 
    @course.apply_publish!
    render json: @course
  rescue StateMachines::InvalidTransition => e
    render json: { message: "can't transition state via non draft to reviewing" }, status: :unprocessable_entity
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user

    if @course.save
      render json: @course, include: [:lessons], status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  def update
    # just clear the lessons every time
    @course.lessons.clear
    if @course.update(course_params)
      render json: @course, include: [:lessons]
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:title, :slug, :description, :published, lessons_attributes: [:room_id, :date, :from, :to])
    end
end
