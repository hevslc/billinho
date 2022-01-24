class Institution < ApplicationRecord
    has_many :enrollment, class_name: "Enrollment"

    validates_presence_of :name
    validates :name, uniqueness: { message: "Já existe instituição com esse nome!" }
    validates :cnpj, uniqueness: { message: "Já existe instituição com esse cnpj!" }
    validates :cnpj, numericality: { only_integer: true, message: "Digite apenas números." }
    validates :ies_type, inclusion: { in: %w("Universidade", "Escola", "Creche"), message: "Precisa ser Universidade, Escola ou Creche"}

end
