# # application.rb
# require 'grape'

# # Load files from the models and api folders
# Dir["#{File.dirname(__FILE__)}/app/models/**/*.rb"].each { |f| require f }
# Dir["#{File.dirname(__FILE__)}/app/api/**/*.rb"].each { |f| require f }

# # Grape API class. We will inherit from it in our future controllers.
# module API
#   class Root < Grape::API
#     format :json
#     prefix :api

#     # Simple endpoint to get the current status of our API.
#     get :status do
#       { status: 'ok' }
#     end

#   end
# end

# # Mounting the Grape application
# Eventtus = Rack::Builder.new {

#   map "/" do
#     run API::Root
#   end


# }