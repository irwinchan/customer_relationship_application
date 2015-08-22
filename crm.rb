require_relative 'rolodex.rb'

class CRM
  attr_accessor :title

  def self.run(name)
    crm = new(name)
    crm.main_menu
  end

  def initialize(name)
    @title = name
    @rolodex = Rolodex.new
  end

  # This is what attr_accessor does:

  # def title
  #   @title
  # end

  # def title=(new_title)
  #   @title = new_title
  # end

  def print_main_menu
    puts "1. Add a contact"
    puts "2. Modify a contact"
    puts "3. Display all contacts"
    puts "4. Display contact"
    puts "5. Display contact attribute"
    puts "6. Delete a contact"
    puts "7. Exit"
  end

  def main_menu
    while true
      print_main_menu
      print "Choose an option: "
      user_input = gets.chomp.to_i
      break if user_input == 7
      choose_option(user_input)
    end
  end

  def choose_option(input)
    # input = user_input
    case input
    when 1 then add_contact
    when 2 then modify_contact
    when 3 then display_all_contacts
    when 4 then display_contact
    when 5 then display_contact_attribute
    when 6 then delete_contact
    when 7 then exit
    else
      puts "I'm sorry Dave, I'm afraid you can't do that."
    end
  end

  def add_contact
    print "First name: "
    first_name = gets.chomp

    print "Last name: "
    last_name = gets.chomp

    print "Email: "
    email = gets.chomp

    print "Notes: "
    notes = gets.chomp

    @rolodex.add_contact(first_name, last_name, email, notes)
  end

  def display_all_contacts
    @rolodex.all.each do |contact|
      puts "#{contact.id}: #{contact.full_name} / #{contact.email}"
    end
  end

  def modify_contact
    clear_term

    puts "Please enter the ID for the contact you wish to modify"
    id = gets.chomp

    contact = get_contact_by_id(id)
    puts contact

    puts "Is this the contact you wish to modify? (yes/no)"
    confirm_sel = gets.chomp

    if confirm_sel == "yes"
      modify_selected_contact(contact)
      clear_term
    end

     return main_menu
  end

  def clear_term
    puts "\e[H\e[2J"
  end

end


CRM.run("Bitmaker Labs CRM")

# my_crm = CRM.new("Bitmaker Labs CRM")
# my_crm.main_menu


# my_crm.title # => "Bitmaker Labs CRM"
# my_crm.title = "Something else"


