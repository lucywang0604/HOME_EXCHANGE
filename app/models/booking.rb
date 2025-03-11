class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  enum :status, { pending: 'pending', accepted: 'accepted', declined: 'declined' }
end
