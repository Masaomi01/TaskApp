class Task < ApplicationRecord
    has_one_attached :eyecatch
    belongs_to :user
    belongs_to :article
    
end
