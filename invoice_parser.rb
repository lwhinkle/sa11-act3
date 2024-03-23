def parse_invoices(invoice_data)
    invoice_data.each_line do |line|
        date = line.scan(/^[0-9]{4}-[0-9]{2}-[0-9]{2}/)
        invoice_num = line.scan(/INV00[0-9]/)
        client = line.scan(/[A-Z][a-z]+ [A-Za-z]+/)
        amount = line.scan(/\$[0-9]+/)
        print("Date: " + date[0] + ", Invoice Number: " + invoice_num[0] + ", Client: " + client[0] + ", Amount: " + amount[0] + "\n")
    end
end

invoice_entries = <<-INVOICES
2023-03-01 - INV001 - Acme Corp - $1000
2023-03-02 - INV002 - Beta LLC - $2050
2023-03-03 - INV003 - Gamma Inc - $3500
INVOICES

parse_invoices(invoice_entries)