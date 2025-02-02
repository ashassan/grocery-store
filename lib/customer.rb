require 'csv'


class Customer 
    
    attr_reader :id 
    attr_accessor :email, :address
    
    def initialize(id,email,address)
        @id = id
        @email = email
        @address = address
    end 
    
    def self.all
        data = CSV.read('data/customers.csv')
        customers = data.map do |person|
            address = {street: person[2], city: person[3], state: person[4], zip: person[5]}
            self.new(person[0].to_i, person[1], address)
        end 
        customers     
    end 
    
    
    def self.find (id)
        data = self.all 
        person_found = data.select {|person| person.id == id }
        person_found[0] 
    end 
    
    
end 








