class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :kind
      t.string :age
      t.boolean :vaccinated
      t.boolean :castrated
      t.boolean :vermifugated
      t.string :coat_color
      t.string :status
      t.string :size
      t.string :sex
      t.belongs_to :publication, null: false, foreign_key: true

      t.timestamps
    end
  end
end
