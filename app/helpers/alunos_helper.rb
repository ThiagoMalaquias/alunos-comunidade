module AlunosHelper

  def tipo_pagamento(payment_type)
    if payment_type == "credit_card"
      return "Cartão de Crédito"

    elsif payment_type == "billet_printed"
      return "Boleto Gerado"

    else
      return "Boleto"
    end
  end

  def status_pagamento_aluno(status)
    if status == "approved"
      return "Aprovado"

    elsif status == "refunded"
      return "Reembolsado"
    
    elsif status == "delayed"
      return "Atrasado"
      
    elsif status == "completed"
      return "Cancelado"

    else
      return "billet_printed, dispute, completed, blocked, chargeback, expired, wayting_payment"
    end
  end
end
