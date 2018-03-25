Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :locations do
        collection do
          get 'last_search'
          get 'name_locations'
          get 'name_distinct'
        end
      end
    end
  end
end
