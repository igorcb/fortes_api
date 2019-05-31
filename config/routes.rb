Rails.application.routes.draw do
  devise_for :users

  #l7brasil.com.br/api/v1/drivers
  namespace :api do
    namespace :v1 do

      #resources :drivers, only: [:create, :update, :index, :show] do
      resources :drivers do
        collection do
          get :find_by_cpf
        end
      end

    end
  end

  # api.l7brasil.com.br/v1/drivers
  # constraints subdomain: 'api' do
  #   scope module: 'api' do
  #     namespace :v1 do
  #       resources :drivers
  #     end
  #   end
  # end
end
