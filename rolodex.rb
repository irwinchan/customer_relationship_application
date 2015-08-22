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
    @contacts.each do |index, contact|
      if contact.id == id
        return contact
      end
    end

    puts "Sorry, there is no record for ID: #{id}"
  end

  def get_key_by_id(id)
    @contacts.each_with_index do |contact, index|
      if contact.id == id
       return index
      end
    end

  end

  def delete_contact_by_id(id)
      @contacts.each_with_index do |contact, index|
      if contact.id == id
        @contacts.delete_at(index)
        return
      end
    end

    puts "Sorry, there is no record for ID: #{id}"
  end

  def modify_selected(contact)
    delete_contact_by_id(contact.id)
    @contact[] << contact
  end

  def all
    @contacts
  end
end