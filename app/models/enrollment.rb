class Enrollment < ApplicationRecord
    belongs_to :student, class_name: "Student"
    belongs_to :institution, class_name: "Institution"
    has_many :invoice, class_name: "Invoice"

    validates_presence_of :total_value, :n_invoice, :due_day, :course, :institution_id, :student_id, message: "Não pode ser vazio."
    validates :total_value, numericality: { greater_than: 0, message: "Deve ser > 0." }
    validates :n_invoice, numericality: { greater_than_or_equal_to: 1, message: "Deve ser >= 1." }
    validates :due_day, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31, message: "Deve ser >= 1 e <= 31." }

    after_create :create_invoices
    
    def create_invoices()
        invoive_value = self.total_value.to_f / self.n_invoice
        due_day = self.due_day
    
        current_date = Date.today
        invoice_date = Date.new(current_date.year,current_date.mon, due_day)
        if due_day <= current_date.mday
          invoice_date = invoice_date.next_month
        end
        
        for n in 1..self.n_invoice
          Invoice.create(value: invoive_value, due_date: invoice_date, status: "Aberta", enrollment_id: self.id)
          invoice_date = invoice_date.next_month
        end
    end
end
