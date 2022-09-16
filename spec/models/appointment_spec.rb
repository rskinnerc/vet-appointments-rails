require 'rails_helper'

RSpec.describe Appointment, type: :model do
  before(:all) do
    @user = User.create(name: 'some name')
    @doctor = Doctor.create(name: 'Some name', specialization: 'Dogs', experience: 2)
    @appointment = Appointment.create(doctor_id: @doctor.id, user_id: @user.id,
                                      date: DateTime.new(2012, 8, 29, 22, 35, 0))
  end

  after(:all) do
    Appointment.delete_all
    Doctor.delete_all
    User.delete_all
  end

  it 'user_id should be present' do
    @appointment.user_id = nil
    expect(@appointment).to_not be_valid
  end

  it 'doctor_id should be present' do
    @appointment.doctor_id = nil
    expect(@appointment).to_not be_valid
  end

  it 'date should be present' do
    @appointment.date = nil
    expect(@appointment).to_not be_valid
  end
end
