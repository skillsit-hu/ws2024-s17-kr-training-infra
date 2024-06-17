class Admin::CoursesController < ApplicationController
  before_action :authorized_admin
  before_action :set_course, only: %i[ show approve revoke destroy ]

  def index
    if params[:state].blank?
      @courses = Course.all
    else
      @courses = Course.where state: params[:state]
    end

    render json: @courses
  end

  def approve
    @course.publish!
    render json: @course
  rescue StateMachines::InvalidTransition => e
    render json: { message: "can't transition state via non reviewing to published" }, status: :unprocessable_entity
  end

  def revoke
    @course.revoke!
    render json: @course
  rescue StateMachines::InvalidTransition => e
    render json: { message: "can't transition state via non published to draft" }, status: :unprocessable_entity
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
