class AddedFieldOnUser < ActiveRecord::Migration
    def change
        add_column :users, :domain, :string
        add_column :users, :access_token, :string
        add_column :users, :refresh_token, :string
        add_column :users, :expires_at, :timestamp
    end
end
