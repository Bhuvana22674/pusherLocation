class Checkin < ApplicationRecord
  include Mongoid::Document
  belongs_to :trip
  after_create :notify_pusher

  field :lat, type: Decimal
  field :lng, type: Decimal
  embedded_in :trip

  # method to publish a user's current location
  def notify_pusher
    Pusher.trigger('location', 'new', self.trip.as_json)
  end
end
