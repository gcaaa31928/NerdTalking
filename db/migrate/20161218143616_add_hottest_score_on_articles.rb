class AddHottestScoreOnArticles < ActiveRecord::Migration[5.0]
    def change
        add_column :articles, :score, :integer, :default => 0
    end
end

