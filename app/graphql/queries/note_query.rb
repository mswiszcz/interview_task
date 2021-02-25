module Queries
  class NoteQuery < BaseQuery
    description "Show note"

    type Types::Models::Note, null: false
    argument :id, ID, required: true

    def resolve(id:)
      # TODO Z4
    end
  end
end
