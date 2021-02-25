module Mutations
  module Notes
    class DeleteMutation < BaseMutation
      graphql_name "DeleteNote"

      argument :id, ID, required: true
      field :note, Types::Models::Note, null: false

      def resolve(id:)
        # TODO Z3
      end
    end
  end
end
