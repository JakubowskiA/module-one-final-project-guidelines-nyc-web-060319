class CreateRelationships < ActiveRecord::Migration[4.2]
  def change
    create_table :relationships do |t|
      t.integer :friender_id
      t.integer :friendee_id
    end
  end
end
