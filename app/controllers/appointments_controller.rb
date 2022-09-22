class AppointmentsController < ApplicationController
  def create
    @date = DateTime.parse(appointment_params[:date])
    @appointment = Appointment.new(user_id: appointment_params[:user_id],
                                   doctor_id: appointment_params[:doctor_id],
                                   city: appointment_params[:city],
                                   date: @date)
    unless @appointment.save
      render json: @appointment.errors.full_messages, status: 400
      return
    end
    render json: 'Successfully created'
  end

  def index
    @appointments = Appointment.where(user_id: params[:user_id])
    render json: @appointments
  end

  def delete
    if Appointment.exists?(appointment_params[:id])
      Appointment.destroy(appointment_params[:id])
      render json: 'Successfully deleted'
      return
    end
    render json: 'Record does not exist, please try again', status: 404
  end

  private

  def appointment_params
    params.require(:appointment).permit(:id, :user_id, :doctor_id, :city, :date )
  end
end
