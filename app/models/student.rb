class Student < ApplicationRecord
    has_many :enrollment, class_name: "Enrollment"

    validates_presence_of :name, :cpf, :gender, :type_payment
    validates :name, uniqueness: { message: "Já existe instituição com esse nome!" }
    validates :cpf, uniqueness: { message: "Já existe instituição com esse cpf!" }
    validates :cpf, numericality: { only_integer: true, message: "Digite apenas números." }
    validates :gender, inclusion: { in: %w("M", "F"), message: "Precisa ser M (masculino) ou F (feminino)"}
    validates :type_payment, inclusion: { in: %w("Boleto", "Cartão"), message: "Precisa ser Boleto ou Cartão"}

end
