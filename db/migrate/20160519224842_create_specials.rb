class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.text :description
      t.string :times
      t.references :bar, index: true

      t.timestamps
    end
  end
end
