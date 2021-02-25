RSpec.describe "Delete Note", type: :request do
  let!(:user) { User.create(api_key: 'api-key-1') }

  let!(:note) do
    Note.create(user: user, title: 'A', content: 'Content', visibility_setting: 'secret')
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
        $id: ID!
      ){
        deleteNote(input: { id: $id }) {
          note {
            id
          }
        }
      }
    GQL
  end

  let(:variables) do
    { id: note.id }
  end

  let(:call_query) do
    post "/graphql", params: { query: query, variables: variables.to_json }, headers: headers
  end

  # TODO Z3
  xit "deletes note", :aggregate_failures do
    expect { call_query }.to change(Note, :count).by(-1)
    expect(response).to have_http_status(:ok)

    json_body = JSON.parse(response.body)
    expect(json_body).to eq(
      {
        "data" => {
          "deleteNote" => {
            "note" => {
              "id" => note.id.to_s,
            }
          }
        }
      }
    )
  end
end
