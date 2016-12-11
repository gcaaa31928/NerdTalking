class CreateAbouts < ActiveRecord::Migration[5.0]
    def change
        create_table :abouts do |t|
            t.timestamps :last_commit
        end
    end
end
