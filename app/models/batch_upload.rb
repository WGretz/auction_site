class BatchUpload < ApplicationRecord
    has_many :listings, inverse_of: :batch_upload
end
