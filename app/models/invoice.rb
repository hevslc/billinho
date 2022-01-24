class Invoice < ApplicationRecord
    belongs_to :enrollment, class_name: "Enrollment"

    validates_presence_of :value, :due_date, :enrollment_id, :status
    validates :status, inclusion: { in: %w("Aberta", "Atrasada", "Paga"), message: "Precisa ser Aberta, Atrasada ou Paga"}
    validates :value

    def validate_sum_invoices(invoice, enrollment)
        totals = invoice.enrollment.total_value
    
        if totals + line.value > invoice.enrollment.total_value
          invoice.errors.add("A soma do valor de todas as faturas deve ser igual ao valor total da matrícula.")
          return false # I think you can alternatively raise an exception here
    end
end
