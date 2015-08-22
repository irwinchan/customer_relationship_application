class Contact
  attr_accessor :id, :first_name, :last_name, :email, :notes

  def initialize(id, first_name, last_name, email, notes)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
  end

  def full_name
    first_name + " " + last_name
  end

  def to_S
    puts "ID: #{@id} \n First Name: #{@first_name} \n Last Name: #{@last_name} \n Email: #{@email} \n Notes: #{@notes}"
  end
end