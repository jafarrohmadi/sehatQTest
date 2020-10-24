Rails.application.routes.draw do
  scope 'api' do
    #Auth
    post 'login', to: 'auth#login'
    post 'register', to: 'auth#register'

    #USERS
    resources :users, param: :email

    #Hospital
    get 'hospital', to: 'hospitals#index'

    #Doctor
    get 'doctor', to: 'doctors#index'
    get 'doctor/schedule', to: 'doctors#schedule'

    #Appointment
    post 'appointment', to: 'appointments#create'
  end
end