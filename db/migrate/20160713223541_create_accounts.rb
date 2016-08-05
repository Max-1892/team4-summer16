class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :gender
      t.integer :age
      t.string :first_name
      t.string :last_name
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
