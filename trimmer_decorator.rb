require './base_decorator'
class TrimmerDecorator < BaseDecorator
  def correct_name
    trimcorrect_name = @nameable.correct_name.slice(0, 10)
    if @nameable.correct_name.size > 10
      trimcorrect_name
    else
      @nameable.correct_name
    end
  end
end
