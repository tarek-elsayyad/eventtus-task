require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

    describe "GET #index" do
        it "index all users" do
            get :index, format: :json
            expect(response.status).to eq(200)
        end
    end

    describe "GET #show" do
        it "show user object data" do
            user = FactoryBot.create(:user)
            get :show, params: { id: user.id}, format: :json
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
        it "create user entry " do
            post :create, params: {user: FactoryBot.attributes_for(:user)} , format: :json
            expect(response.status).to eq(201)
        end
    end

    describe "POST #create" do
        it "returns error response when field is missing" do
            post :create, params: {user: FactoryBot.attributes_for(:user, name: nil)} , format: :json
            expect(response.status).to eq(422)
        end
    end


    describe "POST #update" do
        it "updates user entry " do
            user = FactoryBot.create(:user)
            
            put :update, params: {id: user.id, user: FactoryBot.attributes_for(:user)} , format: :json
            expect(response.status).to eq(200)
        end
    end


    describe "POST #update" do
        it "returns error response when field is missing" do
            user = FactoryBot.create(:user)
            put :update, params: {id: user.id, user: FactoryBot.attributes_for(:user, mobile: nil)} , format: :json
            expect(response.status).to eq(422)
        end
    end

    describe "POST #update" do
        it "returns error response when id is not found" do
            put :update, params: {id: Faker::Number.number, user: FactoryBot.attributes_for(:user)} , format: :json
            expect(response.status).to eq(404)
        end
    end


    describe "POST #destroy" do
        it "destroys user entry " do
            user = FactoryBot.create(:user)
            delete :destroy, params: {id: user.id, user: FactoryBot.attributes_for(:user)} , format: :json
            expect(response.status).to eq(204)
        end
    end

    describe "POST #destroy" do
        it "returns error response when id is not found" do
            put :update, params: {id: Faker::Number.number, user: FactoryBot.attributes_for(:user)} , format: :json
            expect(response.status).to eq(404)
        end
    end
end
