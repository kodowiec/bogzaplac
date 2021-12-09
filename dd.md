# BógZapłać
*Aplikacja do dzielenia się paragonami i kosztami podzielonych zakupów, które w teorii są współdzielone.*

  
  
  
  Aplikacja będzie składać się z dwóch głównych elementów:
  - klient (najwygodniej aplikacja mobilna)
  - serwer [backend] - prawdopodobnie RESTful API komunikujące się z bazą danych, przewiduję użycie .NET Core / node.js
  
  
  ## klient
  ustawienia: nazwa użytkownika, adres IP serwera, port
  todo: jakakolwiek metoda uwierzytelniania, może kiedyś
  
  ### trzy główne ekrany:
  - start (dwa przyciski: dodaj i historia)
  - dodaj (pole edycji tesktu na kwotę, przycisk na ewentualne załączenie zdjęcia paragonu, przycisk submit)
  - historia (ładna lista składająca się z nazwy użytkownika i ostatniej kwoty, kliknięcie w element listy przenosi do widoku paragonu)
  
  ## serwer
  właściwie to na początku przewiduję tylko trzy endpointy
  - /paragon/{id} -- [GET] -- pobranie paragonu
  - /paragon -- [POST] -- upload paragonu
  - /historia -- [GET] -- historia wpisów
  - /dodaj -- [POST] -- dodawanie wpisu 
  
  początkowy plan zawiera wbudowanie w serwer modułu abstrakcji pomiędzy API a bazą danych i przechowywanie wpisów w bazie danych, paragony prawdopodobnie będą przechowywane w formie zwykłych plików na serwerze
  
