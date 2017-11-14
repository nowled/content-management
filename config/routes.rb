Rails.application.routes.draw do
  
  
  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  get 'demo/lynda'
  root 'demo#index'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
