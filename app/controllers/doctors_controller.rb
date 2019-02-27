class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all.sort_by { |n| n.first_name }
  end

  def show
  end

  def new
    @doctor = Doctor.new
    render "form"
  end

  def create
    @doctor = Doctor.create(doctor_params)
    if @doctor.save
      redirect_to doctors_path
    else
      render :new
    end
  end

  def edit
    render "form"
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctor_path(@doctor)
    else
      render :edit
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private
    def doctor_params
      params.require(:doctor).permit(:first_name, :last_name, :specialty, :age)
    end
 
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end
end
