require 'rails_helper'

RSpec.describe Api::V1::TripsController, type: :controller do

    RSpec.configure { |config| config.before(:each, with_user: true) { 
        @user =  FactoryBot.create(:user)
    } 
    }
    describe "GET #index" do
        it "index all trips" do
            get :index, format: :json
            expect(response.status).to eq(200)
        end
    end

    describe "GET #show" do
        it "show trip object data", with_user: true do
            trip = FactoryBot.create(:trip, user: @user)
            get :show, params: { id: trip.id}, format: :json
            expect(response.status).to eq(200)
        end
    end

    describe "GET #show" do
        it "returns error response when id is not found" do
            get :show, params: { id: Faker::Number.number } , format: :json
            expect(response.status).to eq(404)
        end
    end

    describe "POST #create" do
        it "create trip entry ",with_user: true do
            post :create, params: {trip: FactoryBot.attributes_for(:trip, user_id: @user.id)} , format: :json
            expect(response.status).to eq(201)
        end
    end

    describe "POST #create" do
        it "returns error response when field is missing" do
            post :create, params: {trip: FactoryBot.attributes_for(:trip, starting_time: nil)} , format: :json
            expect(response.status).to eq(422)
        end
    end


    describe "POST #update" do
        it "updates trip entry ",with_user: true do
            trip = FactoryBot.create(:trip, user_id: @user.id)
            
            put :update, params: {id: trip.id, trip: FactoryBot.attributes_for(:trip)} , format: :json
            expect(response.status).to eq(200)
        end
    end


    describe "POST #update" do
        it "returns error response when field is missing", with_user: true do
            trip = FactoryBot.create(:trip, user: @user)
            put :update, params: {id: trip.id, trip: FactoryBot.attributes_for(:trip, starting_latitude: nil)} , format: :json
            expect(response.status).to eq(422)
        end
    end

    describe "POST #update" do
        it "returns error response when id is not found",with_user: true do
            put :update, params: {id: Faker::Number.number, trip: FactoryBot.attributes_for(:trip, user: @user)} , format: :json
            expect(response.status).to eq(404)
        end
    end


    describe "POST #destroy" do
        it "destroys trip entry ", with_user: true do
            trip = FactoryBot.create(:trip, user: @user)
            delete :destroy, params: {id: trip.id, trip: FactoryBot.attributes_for(:trip)} , format: :json
            expect(response.status).to eq(204)
        end
    end

    describe "POST #destroy" do
        it "returns error response when id is not found" do
            put :update, params: {id: Faker::Number.number, trip: FactoryBot.attributes_for(:trip)} , format: :json
            expect(response.status).to eq(404)
        end
    end
end
