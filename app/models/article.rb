class Article < ApplicationRecord
    validates :title, presence: true
    serialize :tags
end
