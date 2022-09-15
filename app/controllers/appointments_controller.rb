class AppointmentsController < ApplicationController
  def create
    @date = appointment_params[:date]
    @appointment = Appointment.new(user_id: appointment_params[:user_id],
                                   doctor_id: appointment_params[:doctor_id],
                                   city: appointment_params[:city],
                                   date: DateTime.new(@date[0], @date[1], @date[2], @date[3], @date[4], @date[5]))
    render json: @appointment.errors.full_messages unless @appointment.save
    render json: 'Succesfully created'
  end

  def index
    @appointments = Appointment.where(user_id: appointment_params[:user_id])
    render json: @appointments
  end

  def delete
    Appointment.destroy(appointment_params[:id])
    render json: 'Succesfully deleted'
  end

  private

  def appointment_params
    params.require(:appointment).permit(:id, :user_id, :doctor_id, :city, date: [])
  end
end
