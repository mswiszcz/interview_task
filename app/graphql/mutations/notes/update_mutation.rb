module Mutations
  module Notes
    class UpdateMutation < BaseMutation
      graphql_name "UpdateNote"

      argument :id, ID, required: true
      argument :params, Params::UpdateNoteParams, required: true

      field :note, Types::Models::Note, null: false

      def resolve(id:, params:)
        # TODO Z3
      end
    end
  end
end
