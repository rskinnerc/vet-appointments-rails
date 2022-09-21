require 'swagger_helper'

RSpec.describe 'api/api', type: :request do
    path '/users/create' do

        post 'Creates a user' do
          tags 'User'
          consumes 'application/json'
          parameter name: :user, in: :body, schema: {
            type: :object,
            properties: {
              name: { type: :string },
            },
            required: [ 'name' ]
          }
    
          response '200', 'user created' do
            let(:user) { { name: 'Juan'} }
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
            },
            required: [ 'name','specialization','experience','price' ]
          }
    
          response '200', 'doctor created' do
            let(:doctor) { { name: 'Juan', specialization:'Vet', experience: 5, price: 1.5} }
            run_test!
          end
    
           response '400', 'Doctor not found' do
              let(:doctor) { { specialization:'Vet', experience: 5, price: 1.5} }
             run_test!
           end
        end
    end

    path '/doctors/index' do

        get 'Get the doctors' do
          tags 'Doctor'
    
          response '200', 'doctors found' do
            after do |example|
                content = example.metadata[:response][:content] || {}
                example_spec = {
                  "application/json"=>{
                    examples: {
                      test_example: {
                        value: JSON.parse(response.body, symbolize_names: true)
                      }
                    }
                  }
                }
              end
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
                id: { type: :integer },
              },
              required: [ 'id' ]
          }
    
          response '200', 'doctor deleted' do
            doctor = Doctor.create(name: 'Juan', specialization:'Vet', experience: 5, price: 1.5)
            let(:doctor)  { { id: doctor.id} }
            
            run_test!
          end
    
           response '404', 'User not found' do
             let(:doctor) { { id: 10101 } }
             run_test!
           end
        end
    end
    
end
