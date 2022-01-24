json.extract! invoice, :id, :value, :due_date, :status, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
