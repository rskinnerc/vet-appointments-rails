class DoctorsController < ApplicationController
  def create
    @doctor = Doctor.new(name: doc_params[:name], specialization: doc_params[:specialization],
                         experience: doc_params[:experience], price: doc_params[:price])

    @doctor.photo.attach(params[:doctor][:photo])
    unless @doctor.save
      render json: @doctor.errors.full_messages, status: 400
      return
    end
    render json: 'Successfully created'
    nil
  end

  def index
    @doctors = Doctor.all
    doctors_render = @doctors.map do |doctor|
      if doctor.photo.attached?
        doctor.as_json.merge(
          photo_path: url_for(doctor.photo)
        )
      else
        doctor.as_json
      end
    end
    render json: doctors_render
  end

  def delete
    if Doctor.exists?(doc_params[:id])
      Doctor.destroy(doc_params[:id])
      render json: 'Successfully deleted'
      return
    end
    render json: 'Record does not exist, please try again', status: 404
  end

  private

  def doc_params
    params.require(:doctor).permit(:id, :name, :specialization, :experience, :price, :photo)
  end
end
