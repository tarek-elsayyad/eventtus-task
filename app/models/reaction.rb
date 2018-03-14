class Reaction
  # We define this class as a Mongoid Document
  include Mongoid::Document

  # Generates created_at and updated_at
  include Mongoid::Timestamps

  # include Mongoid::Enum

  # enum :reaction, [:happy, :sad, :love, :cry, :angry]

  # Defining our fields with their types
#   field :reaction, type: String
  field :user_id, type: Integer
  field :reaction, type: String

  
  embedded_in :post


  validates :reaction, presence: true
  validates :user_id, presence: true

  # validates :reaction, inclusion: { in: [:happy, :sad, :love, :cry, :angry] }

end