class AlunoCsvService
  def initialize; end

  def call(arquivo)
    File.foreach(arquivo.tempfile) do |line|
      d = CharlockHolmes::EncodingDetector.detect(line)
      line = line.to_s.encode('UTF-8', d[:encoding], invalid: :replace, replace: '')
      import_line(line.split(',')) if line.present?
    end
  end

  def import_line(line)
    name = 0
    email = 1
    status = 3
    name_subscription_plan = 4
    category = 5
    purchase_date = 10

    return if line[name] == 'Nome' || line[name].blank?

    aluno = Aluno.find_or_create_by(email: line[email])
    aluno.update(name: line[name], status: line[status], name_subscription_plan: line[name_subscription_plan],
       category: line[category], purchase_date: line[purchase_date])
  end
end