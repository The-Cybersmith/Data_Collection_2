class CreateThreats < ActiveRecord::Migration[6.1]
  def change
    create_table :threats do |t|
      t.string :name
      t.string :email
      t.string :severity

      t.timestamps
    end
  end
end
