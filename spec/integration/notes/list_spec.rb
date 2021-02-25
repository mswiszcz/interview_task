RSpec.describe "List notes", type: :request do
  let!(:user) { User.create(api_key: 'api-key-1') }
  let!(:other_user) { User.create(api_key: 'api-key-2') }

  let!(:secret_note) do
    Note.create(user: user, title: 'A', content: 'A', visibility_setting: 'secret')
  end

  let!(:unlisted_note) do
    Note.create(user: other_user, title: 'B', content: 'B', visibility_setting: 'unlisted')
  end

  let!(:java_note) do
    Note.create(
      user: other_user,
      title: 'Java note',
      content: 'Java note content',
      visibility_setting: 'public',
      programming_language: 'java'
    )
  end

  let!(:ruby_note) do
    Note.create(
      user: other_user,
      title: 'Ruby is best',
      content: 'Ruby is awesome!',
      visibility_setting: 'public',
      programming_language: 'ruby'
    )
  end

  let(:headers) do
    {
      HTTP_API_KEY: user.api_key
    }
  end

  let(:query) do
    <<~GQL
      {
        notes {
          title
          content
          programmingLanguage
        }
      }
    GQL
  end

  let(:call_query) do
    post "/graphql", params: { query: query, variables: variables.to_json }, headers: headers
  end

  context "when listing all notes" do
    let(:variables) { {} }

    # TODO Z2
    xit "returns all notes", :aggregate_failures do
      call_query
      expect(response).to have_http_status(:ok)

      json_body = JSON.parse(response.body)
      expect(json_body).to eq(
        {
          "data" => {
            "notes" => [
              {
                "title" => java_note.title,
                "content" => java_note.content,
                "programmingLanguage" => java_note.programming_language
              },
              {
                "title" => ruby_note.title,
                "content" => ruby_note.content,
                "programmingLanguage" => ruby_note.programming_language
              }
            ]
          }
        }
      )
    end
  end

  context "when filtering by programming language" do
    let(:variables) { { "programmingLanguage": "ruby" } }

    xit "returns notes with related programming language" do
      # TODO Z8: Zaimplementuj i przetestuj filtrowanie notatek po języku programowania
    end
  end
end
