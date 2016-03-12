# API do wrzucania i pobierania obrazków
W tym repozytorium znajdziemy klasę `SnapchatAPI`, która jest gotowa do wysyłania obrazka na serwer.
Jest tam zaimplementowana tylko jedna metoda, której zadaniem jest wysłanie obrazka do wszystkich użytkowników:

```swift
static func upload(image image: UIImage, completion: () -> ()) {
  ...
}
```

Na podstawie implementacji tej funkcji odpowiednio zaimplementować 3 następne funkcje, które w swoim ciele mają komentarz:
```swift
// IMPLEMENT HERE
```

Funkcja `upload` może zostać wywołana tak jak w `UploadViewController`:
```swift
SnapchatAPI.upload(image: __UIIMAGE__) { [unowned self] in
  // The request has finished and this is completion block.
  // You can do something like stop spinner or enable buttons etc.
}
```

Funkcja ta sama w sobie robi 2 rzeczy. Pierwsza to zamiana `UIImage` na `NSData`, która jest potrzebna, aby wysłać obrazek na serwer. Druga to już request, czyli wysłanie zapytania POST na serwer. W wywołaniu metody `Alamofire` mamy 3 parametry (oczywiście w naszym przypadku): pierwszy to metoda wysłania (.POST, .GET etc.), drugi to URL (bierzemy to z `SnapchatAPIConstants`), trzeci parameter to właśnie `data`, czyli nasz przetransformowany obrazek. Jeśli chcemy być powiadomieni o zakończeniu operacji lub o np. odpowiedzi od serwera, mamy wtedy funkcje `response`, która zwraca nam dane w postaci czystej `NSData`, ale mamy również funkcje `responseJSON`, która nam od razu parsuje odpowiedź jako JSON. Tutaj także mamy tzw. `completionHandler` czy `completionBlock`, który zawiera informacje o zakończonym requescie.
