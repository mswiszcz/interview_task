module Mutations
  module Notes
    class CreateMutation < BaseMutation
      graphql_name "CreateNote"

      argument :params, Params::CreateNoteParams, required: true
      field :note, Types::Models::Note, null: false

      def resolve(params:)
        # TODO Z3
      end
    end
  end
end
