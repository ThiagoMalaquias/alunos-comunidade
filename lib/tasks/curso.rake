namespace :curso do
  desc "Import Cursos"
  task set_db: :environment do
    require 'net/http'
    require 'json'

    url = URI.parse('http://localhost:3002/cursos.json')
    response = Net::HTTP.get_response(url)
    cursos = JSON.parse(response.body)

    cursos.each do |curso|
      Curso.create(
        titulo: curso["titulo"],
        codeNome: curso["codeNome"],
        descricao: curso["descricao"],
        videoIntro: curso["videoIntro"],
        categorias: curso["categorias"],
        professor: curso["professor"],
        capa: curso["capa"],
        preco: curso["preco"]
      )
    end
  end

  desc "Configurando cursos"
  task configuracao_curso: :environment do
    Curso.where("preco = 'Grátis' or preco = 'Comunidade'").each do |curso|
      curso.tipo = curso.preco
      curso.preco = ""
      curso.save
    end
  end
end