class Note < ApplicationRecord
  has_secure_token :uuid

  belongs_to :user

  enum visibility_setting: %w[secret unlisted public], _prefix: :visibility
  enum programming_language: %w[
    ruby
    csharp
    javascript
    rust
    java
    cpp
  ], _prefix: :programming_language
end
