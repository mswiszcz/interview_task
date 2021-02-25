module Queries
  class MyNotesQuery < BaseQuery
    description "List user notes"

    type [Types::Models::Note], null: false

    def resolve
      # TODO Z2
    end
  end
end
