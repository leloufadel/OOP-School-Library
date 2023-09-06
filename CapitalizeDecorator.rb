require "./BaseDecorator"
class CapitalizeDecorator < BaseDecorator
    #Implement a method correct_name that capitalizes the output of @nameable.correct_name.
    def correct_name
        @nameable.correct_name.capitalize()
    end

    