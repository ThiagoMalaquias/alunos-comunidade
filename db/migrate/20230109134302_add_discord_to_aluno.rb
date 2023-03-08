class AddDiscordToAluno < ActiveRecord::Migration[6.0]
  def change
    add_column :alunos, :discord, :string
  end
end
