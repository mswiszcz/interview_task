module Types
  class MutationType < Types::BaseObject
    field :create_note,
          mutation: Mutations::Notes::CreateMutation

    field :update_note,
          mutation: Mutations::Notes::UpdateMutation

    field :delete_note,
          mutation: Mutations::Notes::DeleteMutation
  end
end
