class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :state
      t.string :city
      t.string :cep
      t.integer :number
      t.string :street
      t.string :complement

      t.references :addressable, polymorphic: true

      t.timestamps
    end
  end
end
