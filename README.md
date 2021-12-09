# codename bogzaplac
*name is subject to change*  
  
  
aplikacja dla ludzi którzy razem dzielą różne wydatki, mogą dodać co kupili i za ile, załączając również zdjęcie paragonu, żeby nie było wątpliwości.  
w założeniu ma to ułatwić prowadzenie historii wydatków i ułatwić rozliczenie się  
przyjmuję, że będzie działać tylko w sieci lokalnej w kontrolowanych warunkach (stąd niski poziom bezpieczeństwa)  

## zasada działania
w aplikacji wpisujemy info o kwocie i ewentualnie dodajemy zdjęcie paragonu, wciskamy dodaj i to się przesyła grzecznie na nasz serwer, który przechowa to w bazie danych  
jeżeli chcemy zobaczyć wpisy naszych partnerów finansowych, wchodzimy w zakładkę historia która pobiera listę wpisów z serwera  
aby uzyskać szczegóły danego wpisu (i ewentualnie zobaczyć zdjęcie paragonu) po prostu naciskamy go
  
### nieco bardziej technicznie
nasz serwer łączy się z bazą danych, która w aktualnej fazie projektu składa się z dwóch tablic
- history (int primary key ID, varchar Username, varchar Date, varchar Cost, int foreign key ReceiptID) -- tu są przechowywane wpisy
- receipts (int primary key ID, varchar Username, mediumblob Image) -- tu przechowujemy zdjęcia (paragonów)

natomiast endpointy api to:
- GET: /history -- lista wpisów
- GET: /history/{id} -- konkretny wpis
- GET: /receipt/{id} -- paragon
- POST: /history -- dodawanie wpisu, pobiera wartości z formularza (Username [wymagane], Date, Cost [wymagane], Image (aby dodać paragon i wpis jednocześnie, przesyłamy jako plik, reszta to zwykły test))
- POST: /receipt -- dodawanie paragonu, j.w. form, (Username [wymagane], Image [wymagane])

wpis nie musi mieć przypisanego mu paragonu, w przyszłości może rozważę dodanie opisów dla wpisów

