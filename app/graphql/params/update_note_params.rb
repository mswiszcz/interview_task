module Params
  class UpdateNoteParams < Types::BaseInputObject
    description "Params for updating a note"

    argument :title, GraphQL::Types::String, required: false
    argument :content, GraphQL::Types::String, required: false

    # TODO Z7
    # argument :visibility_setting, Types::Models::Note.enum(:visibility_settings), required: false
    # argument :programming_language, Types::Models::Note.enum(:programming_languages), required: false
    argument :visibility_setting, Types::Enums::Notes::VisibilitySettings, required: true
    argument :programming_language, Types::Enums::Notes::ProgrammingLanguages, required: false

    argument :expires_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
