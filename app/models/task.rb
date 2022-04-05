class Task < ApplicationRecord
    has_one_attached :eyecatch
    belongs_to :user
    belongs_to :article
    has_many :comments, dependent: :destroy
end
