class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, null: false

    # fix typo when running rails g devise model, unnecessary column
    remove_column :users, "User", :string
  end
end
