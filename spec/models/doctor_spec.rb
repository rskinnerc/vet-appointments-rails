# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Doctor, type: :model do
  subject { Doctor.new(name: 'Some name', specialization: 'Dogs', experience: 2) }

  before { subject.save }

  after(:all) do
    Doctor.delete_all
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'specialization should be present' do
    subject.specialization = nil
    expect(subject).to_not be_valid
  end

  it 'experience should be present' do
    subject.experience = nil
    expect(subject).to_not be_valid
  end
end
