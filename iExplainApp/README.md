# iExplain iOS App

Natywna aplikacja iOS dla firmy **iExplain Sp. z o.o.** – doradcy w zakresie finansowania publicznego (BGK, ARP, PSI).

## Wymagania

- macOS z zainstalowanym Xcode 15+
- iOS 16.0+ (iPhone i iPad)

## Jak uruchomić

1. Otwórz plik `iExplainApp.xcodeproj` w Xcode
2. Wybierz symulator (np. iPhone 15) lub podłączone urządzenie
3. Kliknij **Run** (▶) lub naciśnij `Cmd+R`

## Struktura aplikacji

Aplikacja zawiera 4 zakładki (Tab Bar):

| Zakładka | Plik | Opis |
|---|---|---|
| **O nas** | `HomeView.swift` | Informacje o firmie, karty usług |
| **Usługi** | `ServicesView.swift` | Lista produktów BGK, ARP, PSI |
| **Strefa PSI** | `PSIView.swift` | Szczegóły Polskiej Strefy Inwestycji |
| **Kontakt** | `ContactView.swift` | Dane kontaktowe z przyciskami „Zadzwoń" i „Napisz" |

## Pliki źródłowe

```
iExplainApp/
├── iExplainApp.xcodeproj/        # Projekt Xcode
└── iExplainApp/
    ├── iExplainApp.swift          # Punkt wejścia aplikacji
    ├── ContentView.swift          # Główny widok z Tab Bar
    ├── HomeView.swift             # Zakładka "O nas"
    ├── ServicesView.swift         # Zakładka "Usługi"
    ├── PSIView.swift              # Zakładka "Strefa PSI"
    ├── ContactView.swift          # Zakładka "Kontakt"
    └── Assets.xcassets/           # Zasoby (ikony, kolory)
```

## Dane firmy

- **iExplain Sp. z o.o.**
- ul. Osiedle Zalesie 69, 73-108 Kobylanka
- KRS: 0000609444
- Web: www.iexplain.pl

## Dalszy rozwój

Aby dodać logo firmy:
1. Przeciągnij plik PNG z logo do `Assets.xcassets`
2. W `HomeView.swift` zamień `Image(systemName: "chart.bar.doc.horizontal")` na `Image("NazwaLogo")`
