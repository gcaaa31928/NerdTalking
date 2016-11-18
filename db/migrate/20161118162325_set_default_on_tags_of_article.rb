class SetDefaultOnTagsOfArticle < ActiveRecord::Migration[5.0]
    def change
        change_column :articles, :tags, :string, array: true, default: []
    end
end
