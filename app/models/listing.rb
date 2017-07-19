class Listing < ApplicationRecord
    belongs_to :auction, inverse_of: :listings
    belongs_to :batch_upload, inverse_of: :listings
end
