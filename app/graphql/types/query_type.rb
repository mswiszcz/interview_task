module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :note, Types::Models::Note,
          null: true, resolver: Queries::NoteQuery

    field :notes, [Types::Models::Note],
          null: true, resolver: Queries::NotesQuery

    field :my_notes, [Types::Models::Note],
          null: true, resolver: Queries::MyNotesQuery
  end
end
