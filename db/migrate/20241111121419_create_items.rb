class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.text :description
      t.boolean :done
      t.datetime :created_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
