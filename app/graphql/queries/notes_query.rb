module Queries
  class NotesQuery < BaseQuery
    description "List notes"

    type Types::Models::Note, null: false

    def resolve
      # TODO Z2
    end
  end
end
