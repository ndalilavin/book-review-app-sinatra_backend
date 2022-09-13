class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :username
      t.string :book
      t.timestamps
    end
  end
end
