class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :app_key, :limit => 32
      t.string :app_secret, :limit => 64
      t.boolean :status, :default => 1

      t.timestamps
    end

    add_index :users, :app_key
    add_index :users, :status

    User.create(app_key: ItunesApp::Tool.random_str)
  end
end

