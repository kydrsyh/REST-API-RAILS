class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name,  null: false, default: "", :limit => 255
      t.string :email, null: false, default: "", :limit => 255, unique: true
      t.string :password, null: false, default: ""

      t.timestamps
    end
  end
end
