require 'swagger_helper'
RSpec.describe 'api/v1/tennats', type: :request do
  path '/api/v1/tenants/{id}/update_custom_fields' do
    patch 'Update tenant custom fields' do
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'id'
      parameter name: :tenant, in: :body, schema: {
        type: :object,
        properties: {
          custom_fields_attributes: {
            type: :array,
            items: {
              type: :object
            },
          }
        },
      }

      response '200', 'tenant custom fields updated' do
        let(:id) { create(:tenant).id }
        let(:tenant) do
          {
            tenant: {
              custom_fields_attributes: [{ name: 'Name', label: 'label', field_type: :string }]
            }
          }
        end
        run_test! do
          data = JSON.parse(response.body)

          expect(data['custom_fields'].size).to eq(1)
          expect(data['custom_fields'].first['name']).to eq('name')
        end
      end

      response '422', 'tenant custom fields not updated' do
        let(:id) { create(:tenant).id }
        let(:tenant) do
          {
            tenant: {
              custom_fields_attributes: [{ name: 'Name', label: 'label', field_type: 'not_valid' }]
            }
          }
        end
        run_test! do
          data = JSON.parse(response.body)

          expect(data['errors']).to eq({"custom_fields.field_type"=>["is not included in the list"]})
        end
      end
    end
  end
end
