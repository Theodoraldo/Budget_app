class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.string :name
      t.decimal :amount
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
