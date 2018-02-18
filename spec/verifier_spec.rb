require_relative '../verifier'

RSpec.describe Verifier do
    let(:verifier) {Verifier.new("3-598-21508-8")}

    it 'is initialiazed with a number' do
        expect(verifier.number).to eq("3-598-21508-8")
    end
    
    it 'creates arrays numbers, removing any hyphens' do
        expect(verifier.create_array("3-598-21508-8")).to eq(["3", "5", "9", "8", "2", "1", "5", "0", "8", "8"])
    end

    it 'changes the end key character if it is an x' do
        expect(verifier.change_check_character(["3", "5", "9", "8", "2", "1", "5", "0", "8", "X"])).to eq(["3", "5", "9", "8", "2", "1", "5", "0", "8", "10"])
    end

    it 'changes an array of strings into integers' do
        expect(verifier.strings_to_i(["3", "5", "9", "8", "2", "1", "5", "0", "8", "8"])).to eq([3, 5, 9, 8, 2, 1, 5, 0, 8, 8])
    end

    it 'multiples the numbers by the correct amounts for the ISBN-10 check' do
        expect(verifier.multiply_numbers_10([1, 1, 1, 1, 1, 1, 1, 1, 1, 1])).to eq([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])
    end

    it 'multiples the numbers by the correct amounts for the ISBN-13 check' do 
        expect(verifier.multiply_numbers_13([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1])).to eq([1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1])
    end

    it 'returns the sum of an array of numbers' do
        expect(verifier.add_numbers([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])).to eq(55)
    end

    it 'adds 978 to the begining of a successful ISBN-10 number' do
        expect(verifier.isbn_10_to_13([3, 5, 9, 8, 2, 1, 5, 0, 8, 8])).to eq("9783598215088")
    end

    it 'runs process to return a key value that can be used to know the correct end key of an ISBN-10 number short a key, or if an ISBN-10 number is valid.' do
        expect(verifier.generate_isbn_10(verifier.number)).to eq (0)
    end

    it 'runs process to return a key value that can be used to know the correct end key of an ISBN-13 number short a key, or if an ISBN-13 number is valid.' do
        expect(verifier.generate_isbn_13("978-0-306-40615-7")).to eq(10)
    end
end