class Verifier
    attr_accessor :number

    def initialize(number)
        @number = number
    end

    def create_array(number_array)
        return number_array.split("-").join("").split("")
    end

    def change_check_character(numbers_array)
        if numbers_array[-1] == "X" || numbers_array[-1] == "x"
            numbers_array[-1] = "10"
        end
        return numbers_array
    end

    def strings_to_i(array_of_strings)
        return array_of_strings.map{|i| i.to_i}
    end

    def multiply_numbers_10(numbers_array)
        count = numbers_array.length
        new_numbers_array = []
        numbers_array.each do |number|
            number *= count
            count -= 1
            new_numbers_array << number
        end
        return new_numbers_array
    end

    def multiply_numbers_13(numbers_array)
        count = numbers_array.length
        new_numbers_array = []
        numbers_array.each do |number|
            if count % 2 != 0
                new_numbers_array << number
                count -=1
            else
                number *= 3
                new_numbers_array << number
                count -=1
            end
        end
        return new_numbers_array
    end

    def add_numbers(numbers_array)
        return numbers_array.inject(0, :+)
    end

    def isbn_10_to_13(numbers_array)
        return [9, 7, 8].push(*numbers_array).join
    end

    def number_check_10(number)
        return number % 11
    end

    def number_check_13(number)
        return 10 - (number % 10)
    end

    def length_9?(number)
        return true if number.length == 9
    end

    def length_10?(number)
        return true if number.length == 10
    end

    def length_12?(number)
        return true if number.length == 12
    end

    def length_13?
        return true if number.length == 13
    end

    def generate_isbn_10(number_string)
        array = self.create_array(number_string)
        numbers = self.strings_to_i(array)
        multiplied = self.multiply_numbers_10(numbers)
        added = self.add_numbers(multiplied)
        key = self.number_check_10(added)
        return key
    end

    def generate_isbn_13(number_string)
        array = self.create_array(number_string)
        numbers = self.strings_to_i(array)
        multiplied = self.multiply_numbers_13(numbers)
        added = self.add_numbers(multiplied)
        key = self.number_check_13(added)
        return key
    end

end
