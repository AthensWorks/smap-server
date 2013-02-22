class CreateReactionSmellJoinTable < ActiveRecord::Migration
  def change
    create_table :reactions_smells, :id => false do |t|
      t.integer :smell_id
      t.integer :reaction_id
    end
  end
end
