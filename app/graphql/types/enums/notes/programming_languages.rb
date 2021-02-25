# TODO Z7
module Types
  module Enums
    module Notes
      class ProgrammingLanguages < Types::BaseEnum
        Note.programming_languages.each { |k, v| value k, v }
      end
    end
  end
end
