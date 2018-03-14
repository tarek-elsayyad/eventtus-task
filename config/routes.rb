Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # mount Post::API => '/'
  # mount Eventtus::API::v1 => '/'
  # mount Api::V1 => ‘/’

  # mount API::Base, at: "/"
  mount API::Base, at: "/"
end
