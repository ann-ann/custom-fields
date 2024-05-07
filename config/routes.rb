Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :users, only: [:update]

      resources :tenants do
        patch :update_custom_fields, on: :member
      end
    end
  end
end
