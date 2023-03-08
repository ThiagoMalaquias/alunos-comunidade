namespace :csv do
  desc "Import usuario"
  task set_db: :environment do
    require "csv"
    CSV.foreach('public/planilha_falta_telefone.csv', col_sep: ',').with_index do |linha, indice|
      Aluno.create(name: linha[0], email: linha[1]) if indice.positive?
    end
  end

  desc "Import usuario"
  task update_phone_user: :environment do
    require "csv"
    CSV.foreach('public/planilha_com_telefone.csv', col_sep: ',').with_index do |linha, indice|
      next if indice.zero? || linha[1] == "(none)"
      aluno = Aluno.find_by(email: linha[0])
      aluno.update(phone_checkout_number: linha[1]) if aluno.present?
    end
  end
end