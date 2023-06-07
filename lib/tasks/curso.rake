namespace :curso do
  desc "Import Cursos"
  task set_db: :environment do
    require 'net/http'
    require 'json'

    url = URI.parse('http://localhost:3002/orderCursos.json')
    response = Net::HTTP.get_response(url)
    cursos = JSON.parse(response.body)

    cursos.each_with_index do |curso, index|
      Curso.create(
        id: (index + 1),
        titulo: curso["titulo"],
        codeNome: curso["codeNome"],
        descricao: curso["descricao"],
        videoIntro: curso["videoIntro"],
        categorias: curso["categorias"],
        professor: curso["professor"],
        tipo: curso["tipo"],
        capa: curso["capa"],
        preco: curso["preco"],
        valor_de: curso["valor_de"],
        parcela: curso["parcela"],
        desconto: curso["desconto"],
        horas: curso["horas"],
        aulas: curso["aulas"],
        destaque: curso["destaque"]
      )
    end
  end

  desc "Configurando cursos"
  task configuracao_curso: :environment do
    cursos = [
      { nome: 'Banco de Dados', valor: 150.00 },
      { nome: 'C# Avançado', valor: 200.00 },
      { nome: 'Data Science', valor: 150.00 },
      { nome: 'Java', valor: 180.00 },
      { nome: 'Devops', valor: 180.00 },
      { nome: 'DotNet 7 | C# 11', valor: 180.00 },
      { nome: 'Infraestrutura na Nuvem', valor: 150.00 },
      { nome: 'Kubernetes', valor: 150.00 },
      { nome: 'Lógica de Programação | JavaScript', valor: 120.00 },
      { nome: 'Lógica de Programação | Python', valor: 120.00 },
      { nome: 'Lógica de Programação | Ruby', valor: 120.00 },
      { nome: 'Múltiplas APIs', valor: 180.00 },
      { nome: 'Programação Orientada a Objetos | C#', valor: 180.00 },
      { nome: 'Quality Assurance (QA)', valor: 180.00 },
      { nome: 'WordPress para Programadores', valor: 120.00 }
    ].each do |curso|
      desconto = rand(25..35)
      valor_de = (curso[:valor] + (curso[:valor] * desconto / 100)).to_s.tr('.', ',')
      Curso.find_by(titulo: curso[:nome]).update(preco: "#{curso[:valor].to_s.tr('.', ',')}0", tipo: "Pago", desconto: desconto, valor_de: "#{valor_de}0")
    end
  end


  desc "Atualizando link dos cursos"
  task atualizando_link_curso: :environment do
    cursos = [
      {
        "titulo": "Data Science",
        "linkOptional": "https://pay.kiwify.com.br/qmY48RO"
      },
      {
        "titulo": "DotNet 7 | C# 11",
        "linkOptional": "https://pay.kiwify.com.br/btQ1syP"
      },
      {
        "titulo": "C# Avançado",
        "linkOptional": "https://pay.kiwify.com.br/nOd2Ahe"
      },
      {
        "titulo": "Programação Orientada a Objetos | C#",
        "linkOptional": "https://pay.kiwify.com.br/nOd2Ahe"
      },
      {
        "titulo": "Multiplas API´S",
        "linkOptional": "https://pay.kiwify.com.br/zFmFtHI"
      },
      {
        "titulo": "Lógica de Programação | Ruby",
        "linkOptional": "https://pay.kiwify.com.br/1oDQUo8"
      },
      {
        "titulo": "Devops",
        "linkOptional": "https://pay.kiwify.com.br/SUcyDEt"
      },
      {
        "titulo": "Wordpress",
        "linkOptional": "https://pay.kiwify.com.br/OJ9739q"
      },
      {
        "titulo": "Infraestrutura na Nuvem",
        "linkOptional": "https://pay.kiwify.com.br/jDOKjMg"
      },
      {
        "titulo": "Banco de Dados",
        "linkOptional": "https://pay.kiwify.com.br/6ZFSll8"
      },
      {
        "titulo": "Quality Assurance (QA)",
        "linkOptional": "https://pay.kiwify.com.br/GyTNmve"
      },
      {
        "titulo": "Desafio de Java",
        "linkOptional": "https://pay.kiwify.com.br/G8sdsAp"
      },
      {
        "titulo": "Lógica de Programação | Python",
        "linkOptional": "https://pay.kiwify.com.br/qG39Db2"
      },
      {
        "titulo": "Criação de API´S | C#",
        "linkOptional": "https://pay.kiwify.com.br/HD8UvKJ"
      },
      {
        "titulo": "Kubernetes",
        "linkOptional": "https://pay.kiwify.com.br/cLLgdRf"
      },
      {
        "titulo": "Lógica de Programação | JavaScript",
        "linkOptional": "https://pay.kiwify.com.br/MtfD1Jj"
      }
    ].each do |curso|
      Curso.find_by(titulo: curso[:titulo]).update(link: curso[:linkOptional])
    end
  end

  desc "Atualizando tipo cursos"
  task atualizando_tipo_curso: :environment do
    Curso.where(tipo: "Comunidade").each do |curso|
      next unless curso.preco.present?
      curso.update(tipo: "Pago")
    end
  end
end