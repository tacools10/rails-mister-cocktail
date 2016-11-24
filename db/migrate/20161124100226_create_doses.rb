class CreateDoses < ActiveRecord::Migration[5.0]
  def change
    create_table :doses do |t|
      t.string :description
      t.references :cocktail, foreign_key: true
      t.references :ingredient, foreign_key: true

      t.timestamps null: false
      add_index :dose, [:cocktail, :ingredient], :unique => true
    end
  end
end
