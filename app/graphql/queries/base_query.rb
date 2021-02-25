module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    argument_class Types::BaseArgument

    private

    def current_user
      # TODO
      context[:current_user]
    end
  end
end
