class Comment
  # We define this class as a Mongoid Document
  include Mongoid::Document

  # Generates created_at and updated_at
  include Mongoid::Timestamps

  field :user_id, type: Integer
  field :comment, type: String

  
  embedded_in :post


  validates :comment, presence: true
  validates :user_id, presence: true


end