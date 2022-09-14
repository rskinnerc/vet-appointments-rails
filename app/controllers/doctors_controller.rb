class DoctorsController < ApplicationController
  def create
    @doctor = Doctor.new(doc_params[:name, :specialization, :experience, :price])
    render json: @doctor.errors.full_messages unless @doctor.save
    render json: 'Succesfully created'
  end

  def index
    render json: Doctor.all
  end

  def delete
    Doctor.destroy(doc_params[:id])
    render json: 'Succesfully deleted'
  end

  private

  def doc_params
    params.require(:doctor).permit(:id, :name, :specialization, :experience, :price)
  end
end
