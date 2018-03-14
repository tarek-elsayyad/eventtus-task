require 'rails_helper'
RSpec.describe TripCheckPoint, type: :model do
  it { is_expected.to  validate_presence_of(:trip) }
  it { is_expected.to  validate_presence_of(:latitude) }
  it { is_expected.to  validate_presence_of(:longitude) }
  it { is_expected.to  validate_presence_of(:speed) }
  
  it { is_expected.to  validate_numericality_of(:latitude) }
  it { is_expected.to  validate_numericality_of(:longitude) }
  it { is_expected.to  validate_numericality_of(:speed) }
  it { should belong_to(:user) }
  it { should belong_to(:trip) }

end
