class AddDestaqueToCurso < ActiveRecord::Migration[6.0]
  def change
    add_column :cursos, :destaque, :boolean, default: false
  end
end
