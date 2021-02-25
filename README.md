# AKRA Interview Task

API webowe typu *paste bin* (przykład: http://gist.github.com) pozwalające na zapisywanie swoje notatek.
Notatki mają tytuł, treść oraz przypisany język programowania. Mogą być publiczne, nielistowane (dostępne tylko gdy mamy jej identyfikator) oraz sekretne (dostępne wyłącznie dla osoby która je stworzyła). Aby utrudnić możliwość przeglądania nielistowanych notatek osobom postronnym, należy rozszerzyć notatkę o identyfikator generowany losowo.

## Setup

* Rails 6.0
* Ruby 2.7.2

```
bundle install
bundle exec rake db:create db:migrate db:seed
bundle exec rails s
bundle exec rspec
```

Stworzony użytkownik ma klucz API: `api-key-1`

## Narzędzia

Postman lub GraphiQL do wysyłania żądań do naszego graphQL-owego API. Klucz API należy przekazać w nagłówku: `HTTP_API_KEY: api-key-1`

## Zadania

> Część elementów które należy zmienić lub poprawić w zadaniu znajdziesz w kodzie wyszukując "TODO Z#{numer_zadania}" np. "TODO Z1"

- [ ] Zadanie 1: Dodaj do modelu notatki unikalny identyfikator, np. `uuid`
- [ ] Zadanie 2: Listowanie notatek
  - [ ] Notatki które są publiczne, mogą być listowane za pomocą Query `notes`
  - [ ] Użytkownik może pobrać wszystkie swoje notatki za pomocą Query `myNotes`
- [ ] Zadanie 3: Tworzenie, aktualizowanie i usuwanie notatek
  - [ ] Użytkownik może tworzyć notatki, każda notatka powinna mieć losowo przypisany unikalny identyfikator
  - [ ] Użytkownik może aktualizować swoje notatki używając unikalnego identyfikatora
  - [ ] Użytkownik może usuwać swoje notatki za pomocą query `deleteNote` używając unikalnego identyfikatora
- [ ] Zadanie 4: Pobieranie pojedynczych notatek
  - [ ] Notatki które są publiczne (`public`) oraz nielistowane (`unlisted`), mogą być pobrane przez wszystkich za pomocą query `note` wyłącznie z użyciem unikalnego identyfikatora
  - [ ] Notatki które są prywatne (`secret`), mogą być pobrane wyłącznie przez użytkownika która je stworzył
- [ ] Zadanie 5: Ukrywanie przedawnionych notatek - rozszerzenie listowania oraz pobierania pojedynczych notatek
  - [ ] Notatki które są przedawnione (expired_at jest w przeszłości) powinny być dostępne do pobrania wyłącznie dla użytkownika który jest stworzył, tylko poprzez query `note`
- [ ] Zadanie 6: Poprawienie testów
  - [ ] Aktualnie w systemie są testy które zostały wyłączone, należy testy przywrócić i powinny one przechodzić bez zmian w kodzie testów, jedynie konieczne będzie zaadaptowanie ich  do dodanego przez Ciebie unikalnego identyfikatora notatki
  - [ ] Część testów również brakuje, te są odpowiednio oznaczone

### Opcjonalne zadania

- [ ] Zadanie 7: W typach pojawiają się enumy, których definicje tak na prawdę niewiele się różnią( ProgrammingLanguages oraz VisibilitySettings w types/enums/notes). Rozważ stworzenie metody która wygeneruje te klasy dynamicznie, tak by nie trzeba było tworzyć nowego pliku dla każdego enuma
- [ ] Zadanie 8: Dodaj filtrowanie notatek po atrybucie `programmingLanguage`
- [ ] Zadanie 9: W testach jest wiele duplikacji, rozważ uproszczenie testów, tak by nie trzeba było w każdym z nich na nowo definiować użytkownika, call_query oraz nagłówków
