json.extract! student, :id, :name, :cpf, :birth_date, :cell, :gender, :type_payment, :created_at, :updated_at
json.url student_url(student, format: :json)
