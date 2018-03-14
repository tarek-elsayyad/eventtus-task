require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { is_expected.to  validate_presence_of(:starting_time) }
  it { is_expected.to  validate_presence_of(:starting_latitude) }
  it { is_expected.to  validate_presence_of(:starting_longitude) }




  it { is_expected.to  validate_numericality_of(:starting_latitude) }
  it { is_expected.to  validate_numericality_of(:starting_longitude) }
  it { is_expected.to  validate_numericality_of(:ended_time).only_integer }

  it { is_expected.to define_enum_for(:current_status)}
  
  it { should belong_to(:user) }
  it { should have_many(:trip_check_points) }
  

  it "does not allow previous status" do
    user = FactoryBot.create(:user)
    contact = FactoryBot.create(:trip, current_status: :ongoing, user: user)
    
    expect(contact.update(current_status: :created)).to eq(false) 
  end
end
