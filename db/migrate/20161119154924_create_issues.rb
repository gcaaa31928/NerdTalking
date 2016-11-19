class CreateIssues < ActiveRecord::Migration[5.0]
    def change
        create_table :issues do |t|
            t.string :name
            t.date :date
            t.timestamps
        end
        add_belongs_to :articles, :issue, index: true
    end
end
