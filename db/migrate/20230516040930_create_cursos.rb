class CreateCursos < ActiveRecord::Migration[6.0]
  def change
    create_table :cursos do |t|
      t.string :titulo
      t.string :codeNome
      t.string :descricao
      t.string :videoIntro
      t.string :professor
      t.string :capa
      t.string :link
      t.string :tipo
      t.string :preco
      t.text :categorias, array: true, default: []

      t.timestamps
    end
  end
end
