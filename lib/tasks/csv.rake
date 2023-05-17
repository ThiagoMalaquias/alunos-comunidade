namespace :csv do
  desc "Import usuario"
  task set_db: :environment do
    require "csv"
    CSV.foreach('public/sendblue-users.csv', col_sep: ';').with_index do |linha, indice|
      if indice.positive?
        aluno = Aluno.find_or_create_by(email: linha[0])
        aluno.update(name: linha[1], phone_checkout_number: linha[3])
      end
    end
  end

  # desc "Import usuario"
  # task update_phone_user: :environment do
  #   require "csv"
  #   CSV.foreach('public/planilha_com_telefone.csv', col_sep: ',').with_index do |linha, indice|
  #     next if indice.zero? || linha[1] == "(none)"
  #     aluno = Aluno.find_by(email: linha[0])
  #     aluno.update(phone_checkout_number: linha[1]) if aluno.present?
  #   end
  # end

  desc "Exportar Todos Alunos"
  task export_all_users: :environment do
    require 'csv' 

    file = "#{Rails.root}/public/export_all_users.csv"
    alunos = Aluno.order(:name)
    headers = ["EMAIL", "NAME", "SMS"]

    CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
      alunos.each do |aluno| 
        writer << [aluno.email, aluno.name, aluno.phone_checkout_number] 
      end
    end
  end

  desc "Exportar Alunos Parcionados"
  task export_parse_users: :environment do
    require 'csv' 
    require 'fileutils'

    indice = 1

    loop do
      alunos = Aluno.order(:name).limit(300)
      break if alunos.count == 0

      file = Rails.root.join("public", "alunos_#{indice}.csv")
      FileUtils.mkdir_p(File.dirname(file))
      
      headers = ["EMAIL", "NAME", "SMS"]

      CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
        alunos.each do |aluno| 
          writer << [aluno.email, aluno.name, aluno.phone_checkout_number] 
        end
      end

      alunos.delete_all
      indice += 1
    end
  end
end