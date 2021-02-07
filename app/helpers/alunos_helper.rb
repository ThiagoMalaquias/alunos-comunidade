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
      return "Completado"

    elsif status == "billet_printed"
      return "Boleto Gerado"

    elsif status == "dispute"
      return "Disputa"

    elsif status == "blocked"
      return "Bloqueado"

    elsif status == "chargeback"
      return "Estorno"

    elsif status == "expired"
      return "Expirado"

    elsif status == "wayting_payment"
      return "Meio de Pagamento"
    else
      return "Cancelado"
    end
  end
end
