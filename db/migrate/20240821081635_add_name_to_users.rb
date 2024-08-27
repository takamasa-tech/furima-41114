class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :birthday, :date
  end
end
