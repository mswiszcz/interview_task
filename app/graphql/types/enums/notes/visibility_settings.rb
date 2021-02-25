# TODO Z7
module Types
  module Enums
    module Notes
      class VisibilitySettings < Types::BaseEnum
        Note.visibility_settings.each { |k, v| value k, v }
      end
    end
  end
end
