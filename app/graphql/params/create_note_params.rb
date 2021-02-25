module Params
  class CreateNoteParams < Types::BaseInputObject
    description "Params for creating a note"

    argument :title, GraphQL::Types::String, required: true
    argument :content, GraphQL::Types::String, required: true

    # TODO Z7
    # argument :visibility_setting, Types::Models::Note.enum(:visibility_settings), required: true
    # argument :programming_language, Types::Models::Note.enum(:programming_languages), required: false
    argument :visibility_setting, Types::Enums::Notes::VisibilitySettings, required: true
    argument :programming_language, Types::Enums::Notes::ProgrammingLanguages, required: false

    argument :expires_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
