RSpec.describe "Update Note", type: :request do
  let!(:user) { User.create(api_key: "api-key-1") }

  let!(:note) do
    Note.create(user: user, title: "A", content: "A", visibility_setting: "public")
  end

  let(:headers) do
    {
      HTTP_API_KEY: user.api_key
    }
  end

  # TODO Z1, zmiana z .id na unikalny identyfikator
  let(:query) do
    <<~GQL
      mutation(
        $id: ID!,
        $params: UpdateNoteParams!
      ){
        updateNote(input: { id: $id, params: $params }) {
          note {
            id
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
      id: note.id,
      params: {
        visibilitySetting: "secret"
      }
    }
  end

  let(:call_query) do
    post "/graphql", params: { query: query, variables: variables.to_json }, headers: headers
  end

  # TODO Z3
  xit "updates note", :aggregate_failures do
    expect { call_query }.to change { note.reload.visibility_setting }.from("public").to("secret")

    expect(response).to have_http_status(:ok)

    json_body = JSON.parse(response.body)
    expect(json_body).to eq(
      {
        "data" => {
          "updateNote" => {
            "note" => {
              "id" => note.id.to_s,
              "title" => "A",
              "content" => "A",
              "visibilitySetting" => "secret",
              "programmingLanguage" => nil
            }
          }
        }
      }
    )
  end
end
