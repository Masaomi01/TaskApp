class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.references :article, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.integer :limit
      t.date :deatline, null: false
      t.timestamps
    end
  end
end
