class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :oauth_expires_at
      t.string :oauth_token
      t.string :provider
      t.string :uid
      t.integer :user_id

      t.timestamps
    end

  add_index(:authentications, [:uid, :provider], :unique => true )
  end
end
