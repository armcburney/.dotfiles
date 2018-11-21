class Error
  def self.not_enough_arguments(n)
    puts "Not enough arguments. Please provide at least #{n} arguments."
    exit(1)
  end
end
