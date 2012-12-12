Shotouts::Application.routes.draw do

  namespace :api do
    resources :games do
      post :shot
    end
  end

end
