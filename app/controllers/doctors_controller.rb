class DoctorsController < ApplicationController
  def create
    @doctor = Doctor.new(name: doc_params[:name], specialization: doc_params[:specialization],
                         experience: doc_params[:experience], price: doc_params[:price])
    
    unless @doctor.save
      render json: @doctor.errors.full_messages 
      return
    end
    render json: 'Successfully created'
    return
  end

  def index
    render json: Doctor.all
  end

  def delete
    Doctor.destroy(doc_params[:id])
    render json: 'Successfully deleted'
  end

  private

  def doc_params
    params.require(:doctor).permit(:id, :name, :specialization, :experience, :price)
  end
end
