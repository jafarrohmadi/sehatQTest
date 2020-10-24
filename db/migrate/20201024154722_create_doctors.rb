class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.integer :id_user
      t.string :specialis
      t.string :graduates
      t.timestamps
    end
  end
end
