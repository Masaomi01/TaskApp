class Task < ApplicationRecord
    belongs_to :user
    belongs_to :article
    validates :title, presence: true
    validates :content, presence: true
end
