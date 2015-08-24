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
    @rolodex.add_contact("irwin", "chan", "email@email.com", "notes notes notes")
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
    when 2 then display_modify_menu
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
    clear_term
    print "First name: "
    first_name = gets.chomp

    print "Last name: "
    last_name = gets.chomp

    print "Email: "
    email = gets.chomp

    print "Notes: "
    notes = gets.chomp

    @rolodex.add_contact(first_name, last_name, email, notes)
    clear_term
    puts "Contact Added: #{first_name}, #{last_name}, #{email}, #{notes}"
    puts ""
  end

  def display_all_contacts
    clear_term
    @rolodex.all.each do |contact|
      puts "#{contact.id}: #{contact.full_name} / #{contact.email}"
    end
  end

  def display_modify_menu
    clear_term

    puts "Please enter the ID for the contact you wish to modify"
    id = gets.chomp.to_i

    puts ""
    @rolodex.print_contact_by_id(id)

    puts "Is this the contact you wish to modify? (yes/no)"
    while gets.chomp == "yes"
      puts ""
      puts "Please select the field you would like to modify:"
      puts "1. First name"
      puts "2. Last name"
      puts "3. Email"
      puts "4. Notes"
      puts "5. Done"

      selection = gets.chomp.to_i

      if selection == 1
        print "Enter new value for First name:"
        first_name = gets.chomp
        @rolodex.modify_first_name_by_id(id, first_name)
        clear_term
        break
      elsif selection == 2
        print "Enter new value for Last name:"
        last_name = gets.chomp
        @rolodex.modify_last_name_by_id(id, last_name)
        clear_term
        break
      elsif selection == 3
        print "Enter new value for Email:"
        email = gets.chomp
        @rolodex.modify_email_by_id(id, email)
        clear_term
        break
      elsif selection == 4
        print "Enter new value for Notes:"
        notes = gets.chomp
        @rolodex.modify_notes_by_id(id, notes)
        clear_term
        break
      elsif selection == 5
        clear_term
        break
      else
        puts "Please enter a valid number"
      end
    end

    clear_term
  end

  def display_contact
    clear_term
    print "Please enter the ID of the contact you wish to display: "
    id = gets.chomp.to_i
    puts ""
    @rolodex.print_contact_by_id(id)
    puts ""
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


