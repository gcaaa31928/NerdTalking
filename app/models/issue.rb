class Issue < ApplicationRecord
    has_many :articles
    default_scope { order(created_at: :desc) }

end
