class AppointmentsController < ApplicationController
  before_action :set_doctor

  def index
    @appointments = @doctor.appointments
  end

  def new
    @patients = Patient.all
    @appointment = @doctor.appointments.new
    render "form"
  end

  def create
    @appointment = @doctor.appointments.create(appointment_params)
    if @appointment.save
      redirect_to doctor_appointment_path(@doctor)    
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  # end

  def show
  end

  def destroy
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to doctor_appointments_path
  end

  private

    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end

    def appointment_params
      params.require(:appointment).permit(:dateTime, :location, :patient_id)
    end

end
