module Types
  module Models
    class Note < BaseObject
      field :title, GraphQL::Types::String, null: false
      field :content, GraphQL::Types::String, null: false

      # TODO Z7
      # field :visibility_setting, enum(:visibility_settings), null: false
      # field :programming_language, enum(:programming_languages), null: true

      field :visibility_setting, Types::Enums::Notes::VisibilitySettings, null: false
      field :programming_language, Types::Enums::Notes::ProgrammingLanguages, null: true

      field :created_at, GraphQL::Types::ISO8601DateTime, null: true
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
    end
  end
end
