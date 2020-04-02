class Trip < ApplicationRecord
  include Mongoid::Document
  before_create :set_uuid
  has_many :checkins # trip model's association with the checkins model

  field :name, type: String
  field :uuid, type: String

  # a method that creates a random uuid for each trip before its created
  def set_uuid
    self.uuid = SecureRandom.uuid
  end

  # a method that generates a custom JSON output for our trip objects
  def as_json(options={})
    super(
        only: [:id, :name, :uuid],
        include: { checkins: { only: [:lat, :lng, :trip_id] } }
    )
  end
end
