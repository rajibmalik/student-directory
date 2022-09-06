# First, we put our students into an array, this array is nested to include 
# the cohort month as well as student name 
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # Get the first name
  name = gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # Get another name from the user
    name = gets.chomp
  end
  # Return the array of students
  students
end 
# Makes things easier to read by putting them into methods
def print_header 
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end 

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end 

def interactive_menu 
  students = []
  loop do
    # 1. print the menu and ask the user what to do 
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit " # 9 because more items will be added 
    # 2. read then input and save it into a variable 
    selection = gets.chomp 
    # 3. do what the user has asked
    case selection 
    when "1"
      students = input_students
    when "2"
      print_header 
      print(students)
      print_footer(students)
      # show the students 
    when "9"
      exit # this will cause the program to terminate 
    else 
      puts "I don't know what you meant, try again"
    end 
  end 
end 


interactive_menu
# Nothing will happen until we call the methods we created
#print_header 
#print(students)
#print_footer(students)


