class Enrollment < ApplicationRecord
    belongs_to :student, class_name: "Student"
    belongs_to :institution, class_name: "Institution"
    has_many :invoice, class_name: "Invoice"

    validates_presence_of :total_value, :n_invoice, :due_day, :course, :institution_id, :student_id, message: "Não pode ser vazio."
    validates :total_value, numericality: { greater_than: 0, message: "Deve ser > 0." }
    validates :n_invoice, numericality: { greater_than_or_equal_to: 1, message: "Deve ser >= 1." }
    validates :due_day, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31, message: "Deve ser >= 1 e <= 31." }
    
end
