RSpec.describe "Show note", type: :request do
  let!(:user) { User.create(api_key: 'api-key-1') }
  let!(:other_user) { User.create(api_key: 'api-key-2') }

  let(:headers) do
    {
      HTTP_API_KEY: user.api_key
    }
  end

  # TODO Z1, zmiana z .id na unikalny identyfikator
  let(:query) do
    <<~GQL
      query($id: ID!) {
        note(id: $id) {
          title
          content
        }
      }
    GQL
  end

  let(:variables) { { id: note.id } }

  let(:call_query) do
    post "/graphql", params: { query: query, variables: variables.to_json }, headers: headers
  end

  context "when trying to access my own note" do
    context "when note is secret" do
      let!(:note) { Note.create(user: user, title: 'A', content: 'A', visibility_setting: 'secret') }

      # TODO Z4
      xit "returns note" do
        call_query
        expect(response).to have_http_status(:ok)

        json_body = JSON.parse(response.body)
        expect(json_body).to eq(
          {
            "data" => {
              "note" => {
                "title" => note.title,
                "content" => note.content
              }
            }
          }
        )
      end
    end

    context "when note is unlisted" do
      # TODO Z4: Notatka powinna zostać zwrócona
    end

    context "when note is public" do
      # TODO Z4: Notatka powinna zostać zwrócona
    end
  end

  context "when trying to access someones note" do
    context "when note is secret" do
      # TODO Z4: Użytkownik powinien otrzymać 404
    end

    context "when note is unlisted" do
      # TODO Z4: Notatka powinna zostać zwrócona
    end

    context "when note is public" do
      # TODO Z4: Notatka powinna zostać zwrócona
    end
  end
end
