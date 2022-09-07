@students = [] # An empty array that is accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show a list of the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items 
end 

def interactive_menu
  loop do
    print_menu 
    process(STDIN.gets.chomp)
  end 
end 

def process(selection)
  case selection 
  when "1"
    input_students
  when "2"
    print_students_options
  when "3"
    save_students 
  when "4" 
    load_students
  when "9"
    exit 
  else 
    puts "I don't know what you meant, try again"
  end 
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Get the first name
  name = STDIN.gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # Get another name from the user
    name = STDIN.gets.chomp
  end
end 

def print_students_options
  puts "Select one of the following print options"
  puts "1. Print the entire list of names"
  puts "2. Filter by intial letter of first name"
  puts "3. Print names of students less than 12 characters in length"
  user_print_option = STDIN.gets.chomp
  case user_print_option
  when "1"
    print_header 
    print_students_list
    print_footer
  when "2"
    filter_by_initial_letter
  when "3"
    filter_by_character_length
  else
    puts "Something went wrong, please make another selection"
    print_students_options
  end 
end 

def filter_by_initial_letter
  puts "Type a letter to filter the names by"
  filter_letter = gets.chomp.capitalize
  print_header
  filtered_students = @students.select { |student| student[:name].start_with?(filter_letter)}
  filtered_students.each.with_index(1) do |student, index|
    puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)"
  end 
  puts "Overall, we have #{filtered_students.count} great students"
end 

def filter_by_character_length
  filtered_students = @students.select { |student| student[:name].length < 12}
  filtered_students.each.with_index(1) do |student, index|
    puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)"
  end 
  puts "Overall, we have #{filtered_students.count} great students"
  
end 
# Makes things easier to read by putting them into methods
def print_header 
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_students_list
    @students.each.with_index(1) do |student, index|
        puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)"
    end
end 

def print_footer
    puts "Overall, we have #{@students.count} great students"
end 

def save_students
  # Open the file for writing 
  file = File.open("students.csv", "w")
  # Iterate over the array of students 
  @students.each do |student| 
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end 
  file.close 
end 

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end 
  file.close 
end 

def try_load_students 
  filename = ARGV.first # First arguement from the command line 
  return if filename.nil? # Get out of the method if filename doesn't exist
  if File.exist?(filename) # If it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # If it doesn't exist 
    puts "Sorry, #{filename} doesn't exist."
    exit # Quits the program
  end 
end 

try_load_students 
interactive_menu



