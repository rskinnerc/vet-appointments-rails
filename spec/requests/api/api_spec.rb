require 'swagger_helper'

RSpec.describe 'api/api', type: :request do
  path '/users/create' do
    post 'Creates a user' do
      tags 'User'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '200', 'user created' do
        let(:user) { { name: 'Juan' } }
        run_test!
      end

      response '400', 'User not found' do
        let(:user) { { name: '' } }
        run_test!
      end
    end
  end

  path '/doctors/create' do
    post 'Creates a doctor' do
      tags 'Doctor'
      consumes 'application/json'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          specialization: { type: :string },
          experience: { type: :integer },
          price: { type: :float },
          photo: { type: :string },
          description: { type: :string }
        },
        required: %w[name specialization experience price]
      }

      response '200', 'doctor created' do
        let(:doctor) do
          { name: 'Juan', specialization: 'Vet', experience: 5, price: 1.5, description: 'Description1' }
        end
        run_test!
      end

      response '400', 'Doctor not found' do
        let(:doctor) { { specialization: 'Vet', experience: 5, price: 1.5 } }
        run_test!
      end
    end
  end

  path '/doctors/index' do
    get 'Get the doctors' do
      tags 'Doctor'

      response '200', 'doctors found' do
        # rubocop :disable Lint/UselessAssignment
        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            'application/json' => {
              examples: {
                test_example: {
                  value: JSON.parse(response.body, symbolize_names: true)
                }
              }
            }
          }
        end
        # rubocop :enable Lint/UselessAssignment
        run_test!
      end
    end
  end
  path '/doctors/delete' do
    delete 'Doctor deleted' do
      tags 'Doctor'
      consumes 'application/json'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer }
        },
        required: ['id']
      }

      response '200', 'doctor deleted' do
        doctor = Doctor.create(name: 'Juan', specialization: 'Vet', experience: 5, price: 1.5,
                               description: 'Description1')
        let(:doctor) { { id: doctor.id } }

        run_test!
      end

      response '404', 'User not found' do
        let(:doctor) { { id: 10_101 } }
        run_test!
      end
    end
  end

  path '/appointments/create' do
    post 'Creates a appointment' do
      tags 'Appointment'
      consumes 'application/json'
      parameter name: :appointment, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          doctor_id: { type: :integer },
          city: { type: :string },
          date: { type: :string }
        },
        required: %w[user_id doctor_id city date]
      }

      response '200', 'appointment created' do
        user = User.last
        doctor = Doctor.create(name: 'Juan', specialization: 'Vet', experience: 5, price: 1.5,
                               description: 'Description1')
        let(:appointment) do
          { user_id: user.id, doctor_id: doctor.id, city: 'Santo Domingo', date: '2022-09-15T16:19:51.466Z' }
        end
        run_test!
      end

      response '400', 'Appointment not found' do
        doctor = Doctor.create(name: 'Juan', specialization: 'Vet', experience: 5, price: 1.5,
                               description: 'Description1')
        user = User.create(name: 'Juan12')
        let(:appointment) { { user_id: user.id, doctor_id: doctor.id, date: '2022-09-15T14:53:59.443Z' } }
        run_test!
      end
    end
  end
  path '/users/{user_id}/appointments' do
    get 'Get the appointment' do
      tags 'Appointment'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :integer

      response '200', 'appointments found' do
        user = User.last
        puts user.name
        let(:user_id) { user.id }
        # rubocop :disable Lint/UselessAssignment
        after do |example|
          content = example.metadata[:response][:content] || {}
          example_spec = {
            'application/json' => {
              examples: {
                test_example: {
                  value: JSON.parse(response.body, symbolize_names: true)
                }
              }
            }
          }
        end
        # rubocop :enable Lint/UselessAssignment
        run_test!
      end
    end
  end
  path '/appointments/delete' do
    delete 'Appointment deleted' do
      tags 'Appointment'
      consumes 'application/json'
      parameter name: :appointment, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer }
        },
        required: ['id']
      }

      response '200', 'Successfully deleted' do
        user = User.last
        doctor = Doctor.create(name: 'Juan', specialization: 'Vet', experience: 5, price: 1.5,
                               description: 'Description1')
        appointment = Appointment.create(user_id: user.id, doctor_id: doctor.id, city: 'Santo Domingo',
                                         date: '2022-09-15T16:19:51.466Z')
        let(:appointment) { { id: appointment.id } }

        run_test!
      end

      response '404', 'Appointment not found' do
        let(:appointment) { { id: 10_101 } }
        run_test!
      end
    end
  end
end
