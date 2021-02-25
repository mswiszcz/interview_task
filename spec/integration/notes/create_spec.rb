RSpec.describe "Create Note", type: :request do
  let!(:user) { User.create(api_key: 'api-key-1') }

  let(:headers) do
    {
      HTTP_API_KEY: user.api_key
    }
  end

  let(:query) do
    <<~GQL
      mutation(
        $params: CreateNoteParams!
      ){
        createNote(input: { params: $params }) {
          note {
            title
            content
            visibilitySetting
            programmingLanguage
          }
        }
      }
    GQL
  end

  let(:variables) do
    {
      params: {
        title: "Title",
        content: "Content",
        visibilitySetting: "secret",
        programmingLanguage: "ruby"
      }
    }
  end

  let(:call_query) do
    post "/graphql", params: { query: query, variables: variables.to_json }, headers: headers
  end

  # TODO Z3
  xit "creates note", :aggregate_failures do
    expect { call_query }.to change(Note, :count).by(1)

    expect(response).to have_http_status(:ok)

    json_body = JSON.parse(response.body)
    expect(json_body).to eq(
      {
        "data" => {
          "createNote" => {
            "note" => {
              "title" => "Title",
              "content" => "Content",
              "visibilitySetting" => "secret",
              "programmingLanguage" => "ruby"
            }
          }
        }
      }
    )
  end
end
