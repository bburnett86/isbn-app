require_relative 'verifier'
require_relative 'view'

class Controller
    attr_accessor :verifier

    def initialize
        @view = View.new
        @verifier = 0
    end

    def intro
        return @view.intro
    end

    def create_verifier(string)
        @verifier = Verifier.new(string)
    end

    def process(number_string)
        array = @verifier.create_array(number_string)
        array_of_numbers = @verifier.strings_to_i(array)
        checked_array = @verifier.change_check_character(array_of_numbers)
        multiplied_array = @verifier.multiply_numbers_10(checked_array)
        added_string = @verifier.add_numbers(multiplied_array)
        return added_string
    end

    def process_13(number_string)
        array = @verifier.create_array(number_string)
        array_of_numbers = @verifier.strings_to_i(array)
        multiplied_array = @verifier.multiply_numbers_13(array_of_numbers)
        added_string = @verifier.add_numbers(multiplied_array)
        return added_string
    end

    def isbn_10
        string = @view.intro_10
        @verifier = Verifier.new(string)
        array = @verifier.create_array(string)
        until array.length == 10
            new_string = @view.wrong_10
            array = @verifier.create_array(new_string)
        end
        processed = self.process(string)
        validated = @verifier.number_check_10(processed)
        @view.valid?(validated)
        if validated == 0
            ten_to_thirteen = @view.ten_to_13_question
            if ten_to_thirteen.downcase == "y" || ten_to_thirteen.downcase == "yes"
                results = @verifier.isbn_10_to_13(@verifier.create_array(@verifier.number))
                return @view.ten_to_13_success(results)
            end
        end
    end

    def isbn_10_generate
        string = @view.isbn_10_generator_intro
        @verifier = Verifier.new(string)
        array = @verifier.create_array(string)
        until array.length == 9
            string = @view.wrong_9
            @verifier.number = string
            array = @verifier.create_array(@verifier.number)
        end
        processed = self.process(string)
        key = @verifier.number_check_10(processed)
        return @view.generate_isbn_10(key)
    end

    def isbn_13
        string = @view.intro_13
        @verifier = Verifier.new(string)
        array = @verifier.create_array(string)
        until array.length == 13
            string = @view.wrong_13
            @verifier.number = string
            array = @verifier.create_array(@verifier.number)
        end
        processed = self.process_13(string)
        key = @verifier.number_check_13(processed)
        return @view.number_check_13(key)
    end

    def isbn_13_generate
        string = @view.isbn_13_generator_intro
        @verifier = Verifier.new(string)
        array = @verifier.create_array(string)
        until array.length == 12
            string = @view.wrong_12
            @verifier.number = string
            array = @verifier.create_array(@verifier.number)
        end
        processed = self.process_13(string)
        key = @verifier.number_check_13(processed)
        return @view.generate_isbn_13(key)
    end
end

