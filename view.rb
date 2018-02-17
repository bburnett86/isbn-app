class View
    def intro
        puts "Welcome to the ISBN Testing App."
        puts "If you would like to check an ISBN-10 number type '0'."
        puts "If you would like to generate a key for an ISBN-10 number type '10'."
        puts "If you would like to check an ISBN-13 number type '1'."
        puts "If you would like to generate a key for an ISBN-13 type '13'."
        puts "Type 'exit' to exit."
        gets.chomp
    end

    def intro_10
        puts "Please insert ISBN-10 string"
        return gets.chomp
    end

    def intro_13
        puts "Please insert ISBN-13 string"
        return gets.chomp
    end

    def isbn_10_generator_intro
        puts "Please enter the first 9 digits of your ISBN-10 number with any number of hyphens ('-') you'd like included"
        return gets.chomp
    end

    def isbn_13_generator_intro
        puts "Please enter the first 12 digits of your ISBN-13 number with any number of hyphens ('-') you'd like included"
        return gets.chomp
    end

    def correct_amount
        puts "Please choose an ISBN number with 10 or 13 digits"
        return gets.chomp
    end

    def valid?(results)
        if results == 0
            puts "Your ISBN-10 string is valid"
        else
            puts "Your ISBN-10 string is invalid"
        end
    end

    def generate_isbn_10(results)
        if results == 10
            puts "To complete this ISBN-10 string your key should be an X"
        else
            puts "To complete this ISBN-10 string your key should be a #{results.to_s}"
        end
    end

    def generate_isbn_13(results)
        puts "To complete this ISBN-13 string your key should be a #{results.to_s}"
    end

    def continue
        puts "If you would like to generate a key for an ISBN-13 type '13', if you would like to generate a key for an ISBN-10 number type '10', if you would like to check another ISBN-10 number type '0', if you would like to check an ISBN-13 number type '1', or type 'exit' to exit."
        return gets.chomp
    end

    def number_check_13(results)
        if results == 10
            puts "Your ISBN-13 string is valid"
        else
            puts "Your ISBN-13 string is invalid"
        end
    end

    def ten_to_13_question
        puts "If you would like to turn your ISBN-13 number to an ISBN-10 number type in y or yes"
        gets.chomp
    end

    def ten_to_13_success(results)
        puts "Your ISBN-10 number would have to become #{results} to transform into an ISBN-13 Number"
    end

    def wrong_9
        puts "Please enter a string with exactly nine numbers, with however many hashes, and without any other numbers, letters, or symbols."
        return gets.chomp
    end

    def wrong_10
        puts "Please enter a string with either ten numbers or nine numbers followed by an X, along with however many hashes, and without any other numbers, letters, or symbols."
        return gets.chomp
    end

    def wrong_12
        puts "Please enter a string with exactly 12 numbers, with however many hashes, and without any other numbers, letters, or symbols."
        return gets.chomp
    end

    def wrong_13
        puts "Please enter a string with exactly 13 numbers, with however many hashes, and without any other numbers, letters, or symbols."
        return gets.chomp
    end
end