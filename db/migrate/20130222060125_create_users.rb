class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :gitcycle
      t.string :github
      t.string :gravatar
      t.string :login
      t.string :name

      t.timestamps

      t.index [ :github, :login ], :unique => true
      t.index :github,             :unique => true
      t.index :gitcycle,           :unique => true
      t.index :login,              :unique => true
    end
  end
end
