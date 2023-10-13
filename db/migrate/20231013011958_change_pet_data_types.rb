class ChangePetDataTypes < ActiveRecord::Migration[7.0]
  def up
    change_table :pets do |t|
      t.change :vaccinated, :string
      t.change :castrated, :string
      t.change :vermifugated, :string
    end
  end

  def down
    change_table :pets do |t|
      t.change :vaccinated, :boolean
      t.change :castrated, :boolean
      t.change :vermifugated, :boolean
    end
  end
end
