class CreateArticles < ActiveRecord::Migration[5.0]
    def change
        create_table :articles do |t|
            t.string :title
            t.string :desc
            t.string :url
            t.date :date
            t.timestamps
        end
    end
end
