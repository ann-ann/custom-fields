require 'swagger_helper'
RSpec.describe 'api/v1/users', type: :request do
  path '/api/v1/users/{id}' do
    patch 'Update user' do
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'id'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          custom_field_values_attributes: {
            type: :array,
            items: {
              type: :object
            },
          }
        },
      }

      response '200', 'user updated' do
        let(:tenant) { create(:tenant) }
        let(:id) { create(:user, tenant: tenant).id }
        let(:custom_field_id) { create(:custom_field, :string, tenant_id: tenant.id).id }
        let(:email) { 'test@mail.com' }
        let(:user) do
          {
            user: {
              email: email,
              custom_field_values_attributes: [{ custom_field_id: custom_field_id, value: 'test' }]
            }
          }
        end
        run_test! do
          data = JSON.parse(response.body)

          expect(data['email']).to eq(email)
          expect(data['custom_field_values'].size).to eq(1)
          expect(data['custom_field_values'].first['value']).to eq('test')
        end
      end

      response '422', 'user not updated' do
        let(:tenant) { create(:tenant) }
        let(:id) { create(:user, tenant: tenant).id }
        let(:custom_field_id) do
          create(:custom_field, :multiselect, tenant_id: tenant.id, available_values: ['1', '2']).id
        end

        let(:user) do
          {
            user: {
              custom_field_values_attributes: [{ custom_field_id: custom_field_id, value: '1' }],
              custom_field_values_attributes: [{ custom_field_id: custom_field_id, value: '3' }]
            }
          }
        end
        run_test! do
          data = JSON.parse(response.body)

          expect(data['errors']).to eq({"custom_field_values.value"=>["is not a valid option"]})
        end
      end
    end
  end
end
