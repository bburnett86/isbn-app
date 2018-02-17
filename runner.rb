require_relative 'controller'
require_relative 'view'

controller = Controller.new
view = View.new
result = controller.intro
until result == "exit"
    if result == "13"
        controller.isbn_13_generate
        result = view.continue
    elsif result == "10"
        controller.isbn_10_generate
        result = view.continue
    elsif result == "0"
        controller.isbn_10
        result = view.continue
    elsif result == "1"
        controller.isbn_13
        result = view.continue
    else
        result = "exit"
    end
end