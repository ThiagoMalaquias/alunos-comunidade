class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :senha

      t.timestamps
    end
  end
end
