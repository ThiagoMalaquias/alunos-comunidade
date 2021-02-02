module AlunosHelper

  def tipo_pagamento(payment_type)
    if payment_type == "credit_card"
      return "Cartão de Crédito"
    else
      return "Boleto"
    end
  end

  def status_pagamento_aluno(status)
    if status == "approved"
      return "Aprovado"
    else
      return "Cancelado"
    end
  end
end
