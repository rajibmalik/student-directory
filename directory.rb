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
# And then print them
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
    put student
end 
# Finally, we print the total number of students using string interpolation
puts "Overall, we have #{students.count} great students"
