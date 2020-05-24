class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :user_name
      t.string :password

      t.timestamps
    end
  end
end
