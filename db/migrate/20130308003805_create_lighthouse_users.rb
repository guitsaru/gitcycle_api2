class CreateLighthouseUsers < ActiveRecord::Migration
  def change
    create_table :lighthouse_users do |t|
      t.string  :token
      
      t.integer :lighthouse_id
      t.integer :user_id

      t.timestamps

      t.index :lighthouse_id
      t.index :user_id
    end
  end
end
