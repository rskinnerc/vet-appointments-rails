require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Some name') }

  before { subject.save }

  after(:all) do
    User.delete_all
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
