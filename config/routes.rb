Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  post 'treasure_hunt', to: 'treasure_hunt#hunt'
end
