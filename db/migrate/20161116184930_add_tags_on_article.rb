class AddTagsOnArticle < ActiveRecord::Migration[5.0]
    def change
        add_column :articles, :tags, :string, array: true
    end
end
