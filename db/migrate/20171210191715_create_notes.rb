class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :content
      t.integer :notebook_id
    end
  end
end
