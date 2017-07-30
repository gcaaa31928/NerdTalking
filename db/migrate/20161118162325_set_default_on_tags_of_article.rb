class SetDefaultOnTagsOfArticle < ActiveRecord::Migration[5.0]
    def change
        change_column(:articles, :tags, :text, array: true)
        change_column_default :articles, :tags, '[]'
    end
end
