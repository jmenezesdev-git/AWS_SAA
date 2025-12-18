class CreateTables < ActiveRecord::Migration[8.1]
  def change
    create_table :things do |t|
      t.string :name
      t.timestamps
    end

    Thing.create!(name: "Hello")
    Thing.create!(name: "Gensokyo")
    Thing.create!(name: "Goodbye")
    Thing.create!(name: "Tokyo")
  end
end
