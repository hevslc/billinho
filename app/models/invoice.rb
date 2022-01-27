class Invoice < ApplicationRecord
    belongs_to :enrollment, class_name: "Enrollment"

    validates_presence_of :value, :due_date, :enrollment_id, :status
    validates :status, inclusion: { in: ["Aberta", "Atrasada", "Paga"], message: "Precisa ser Aberta, Atrasada ou Paga"}
    validate :validate_sum_invoices
    validate :validate_qtd_invoices

    def validate_sum_invoices
        total_invoices = Invoice.where(:enrollment_id => enrollment_id).sum(:value)

        if total_invoices + self.value > self.enrollment.total_value
          errors.add(:value, "A soma do valor de todas as faturas deve ser igual ao valor total da matrícula.")
        end
    end

    def validate_qtd_invoices
        qtd_invoices = Invoice.where(:enrollment_id => enrollment_id).length()

        if qtd_invoices == self.enrollment.n_invoice
            errors.add(" ", "Quantidade de faturas ultrappasa a quantidade de Faturas definida para essa matricula.")
        end
    end
end
