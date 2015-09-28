class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :nombre, null: false
      t.integer :votos, null: false, default: 0

      t.timestamps null: false
    end
  end
end
