Shotouts::Application.routes.draw do

  namespace :api do
    resources :games do
      resources :shots
    end
  end

end
