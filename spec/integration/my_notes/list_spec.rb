RSpec.describe "List my notes", type: :request do
  let!(:user) { User.create(api_key: 'api-key-1') }
  let!(:other_user) { User.create(api_key: 'api-key-2') }

  let!(:secret_note) do
    Note.create(user: user, title: 'A', content: 'A', visibility_setting: 'secret')
  end

  let!(:unlisted_note) do
    Note.create(user: user, title: 'B', content: 'B', visibility_setting: 'unlisted')
  end

  let!(:public_note) do
    Note.create(user: user, title: 'C', content: 'C', visibility_setting: 'public')
  end

  let!(:other_user_note) do
    Note.create(user: other_user, title: 'C', content: 'C', visibility_setting: 'public')
  end

  let(:headers) do
    {
      HTTP_API_KEY: user.api_key
    }
  end

  let(:query) do
    <<~GQL
      {
        myNotes {
          title
          content
          visibilitySetting
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
            "myNotes" => [
              {
                "title" => secret_note.title,
                "content" => secret_note.content,
                "visibilitySetting" => secret_note.visibility_setting
              },
              {
                "title" => unlisted_note.title,
                "content" => unlisted_note.content,
                "visibilitySetting" => unlisted_note.visibility_setting
              },
              {
                "title" => public_note.title,
                "content" => public_note.content,
                "visibilitySetting" => public_note.visibility_setting
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
