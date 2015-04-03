class AddVerifiedToRelations < ActiveRecord::Migration
  def change
    add_column :relations, :verified, :boolen
  end
end
