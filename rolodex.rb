require_relative('contact.rb')

class Rolodex
  @@id = 1000

  def initialize
    @contacts = []
  end

  def add_contact(first_name, last_name, email, note)
    contact = Contact.new(@@id, first_name, last_name, email, note)
    @@id += 1

    @contacts << contact
  end

  def get_contact_by_id(id)
    @contact.each do |contact|
      if contact.id == id
        return contact
      end
    end

    puts "Sorry, there is no record for ID: #{id}"
  end

  def all
    @contacts
  end
end