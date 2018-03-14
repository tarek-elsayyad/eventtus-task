require 'rails_helper'

RSpec.describe Api::V1::TripCheckPointsController, type: :controller do

    RSpec.configure { |config| config.before(:each, with_user_and_trip: true) { 
        @user =  FactoryBot.create(:user)
        @trip =  FactoryBot.create(:trip, user: @user)
        } 
    }

    describe "GET #index" do
        it "index all trip_check_points", with_user_and_trip: true do
            get :index, params: {trip_id: @trip.id}, format: :json
            expect(response.status).to eq(200)
        end
    end

    describe "GET #show" do
        it "show trip_check_point object data", with_user_and_trip: true do
            trip_check_point = FactoryBot.create(:trip_check_point, user: @user, trip: @trip)
            get :show, params: { trip_id: @trip.id, id: trip_check_point.id}, format: :json
            expect(response.status).to eq(200)
        end
    end

    describe "GET #show" do
        it "returns error response when id is not found" do
            get :show, params: { trip_id: Faker::Number.number,  id: Faker::Number.number } , format: :json
            expect(response.status).to eq(404)
        end
    end

    describe "POST #create" do
        it "create trip_check_point entry ",with_user_and_trip: true do
            post :create, params: {trip_id: @trip.id, trip_check_point: FactoryBot.attributes_for(:trip_check_point, user_id: @user.id)} , format: :json
            expect(response.status).to eq(201)
        end
    end

    describe "POST #create" do
        it "returns error response when field is missing",with_user_and_trip: true do
            post :create, params: {trip_id: @trip.id, trip_check_point: FactoryBot.attributes_for(:trip_check_point, speed: nil, user_id: @user.id, starting_time: nil)} , format: :json
            expect(response.status).to eq(422)
        end
    end
end
