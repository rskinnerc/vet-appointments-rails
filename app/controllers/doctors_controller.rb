class DoctorsController < ApplicationController
  def create
    @doctor = Doctor.new(name: doc_params[:name], specialization: doc_params[:specialization],
                         experience: doc_params[:experience], price: doc_params[:price])
    @doctor.photo.attach(params[:doctor][:photo])
    render json: @doctor.errors.full_messages unless @doctor.save
    render json: 'Succesfully created'
  end

  def index
    # render json: Doctor.all

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
    Doctor.destroy(doc_params[:id])
    render json: 'Succesfully deleted'
  end

  private

  def doc_params
    params.require(:doctor).permit(:id, :name, :specialization, :experience, :price, :photo)
  end
end
