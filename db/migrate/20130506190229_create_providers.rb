class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :secret
      t.string :key

      t.timestamps
    end
  end
end
