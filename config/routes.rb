Rails.application.routes.draw do
root "doctors#index"

resources :doctors do
  resources :appointments
end

resources :patients

end
