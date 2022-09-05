# First, we put our students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# Makes things easier to read by putting them into methods
def print_header 
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(names)
    names.each do |name|
        puts name
    end
end 

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end 

# Nothing will happen until we call the methods we created
print_header 
print(students)
print_footer(students)


