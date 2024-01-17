# Akademia Tarnowska

## Kurs

### Testowanie i jakość oprogramowania / Projekt

## Autor

### Arkadiusz Nowak

## Temat

### Aplikacja do transferu danych dźwiękiem

## Opis Projektu

![image](https://i.imgur.com/1kRHKsQ.png)

Transfer danych to obecnie jeden z najważniejszych elementów potrzebnych do pracy czy też zabawy przy użyciu komputera,
realizowany może on być na wiele różnych sposobów

Jednym z nich jest transfer za pomocą dźwięków lub ultradźwięków. W przeszłości próbowano tworzyć takie rozwiązania,
lecz z racji na niezbyt dużą prędkość przesyłu oraz w przypadku braku odpowiednich metod oczyszczania dźwięku porzucono
działania.

W tym projekcie podjęto się stworzenia biblioteki w języku dart dla framework’a flutter, umożliwia ona transfer pomiędzy
dwoma urządzeniami z czego jedno jest nadajnikiem a drugie odbiornikiem a komunikacja na razie jest wywoływana przez
użytkownika manualnie. Obecnie aplikacja znajduje się w fazie badawczej i pozwala na swobodny transfer 4 liter z racji
na ograniczenia urządzeń mobilnych (problem z dekodowaniem dźwięków poprzez dużą ilość obliczeń).

## Instalacja i uruchamianie aplikacji oraz testów

Najpierw należy zainstalować pakiet FVM na swoim systemie operacyjnym https://fvm.app/

```bash
git clone git@github.com:snggle/mrumru.git

fvm install 3.13.9

fvm use 3.13.9

fvm flutter pub get
```

Uruchamianie aplikacji

```bash
cd example

fvm flutter run lib/main.dart (jesli emulator telefonu jest otwarty)

fvm flutter run lib/main.dart -d <device ID>
```

Uruchamianie testów jednostkowych

```bash
fvm flutter test test/unit --null-assertions
```

Scenariusze testów manualnych

| Test Case ID. | Opis                                                                                                             | Kroki Testowe                                                                                                                                                                              | Oczekiwany Wynik                                                                                                                                      |
|---------------|------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| TC_01         | Weryfikacja poprawności przekształcania wiadomości tekstowej na sygnał dźwiękowy.                                | 1. Wpisz wiadomość tekstową w pole "message"<br/> 2. Kliknij "Start emission".                                                                                                             | Aplikacja przekształca wiadomość tekstową na sygnał dźwiękowy i rozpoczyna emisję.                                                                    |
| TC_02         | Weryfikacja transmisji dźwiękowej pomiędzy dwoma urządzeniami                                                    | 1. Umieść blisko siebie dwa urządzenia<br/> 2. Wpisz wiadomość i uruchom emisję na jednym z urządzeń.<br/> 3. Spróbuj odbierać sygnał na drugim urządzeniu.                                | Drugie urządzenie odbiera sygnał dźwiękowy i przekształca go na wiadomość tekstową.                                                                   |
| TC_03         | Sprawdzenie zasięgu transmisji dźwiękowej.                                                                       | 1. Rozmieść dwa urządzenia w różnych odległościach.<br/> 2. Wpisz wiadomość i uruchom emisję na jednym z urządzeń.<br/> 3. Spróbuj odbierać sygnał na drugim urządzeniu.                   | Drugie urządzenie odbiera sygnał dźwiękowy i przekształca go na wiadomość tekstową.                                                                   |
| TC_04         | Testowanie reakcji aplikacji na próbę emisji pustej wiadomości.                                                  | 1. Pozostaw pole "message" puste.<br/> 2. Kliknij "Start emission".                                                                                                                        | Aplikacja nie rozpoczyna emisji                                                                                                                       |
| TC_05         | Sprawdzenie możliwości przerwania emisji dźwięku.                                                                | 1. Wpisz wiadomość i rozpocznij emisję.<br/> 2. Kliknij "Stop emission" w trakcie emisji.                                                                                                  | Emisja dźwięku zostaje natychmiast przerwana.                                                                                                         |
| TC_06         | Testowanie zdolności aplikacji do nagrywania i rozpoznawania sygnału dźwiękowego.                                | 1. W drugim urządzeniu kliknij "Start recording" podczas gdy pierwsze urządzenie emituje dźwięk.<br/> 2. Po zakończeniu emisji, sprawdź, czy nagranie zawiera oczekiwany sygnał dźwiękowy. | Drugie urządzenie zapisuje sygnał dźwiękowy, który jest wiernym odbiciem emisji z pierwszego urządzenia                                               |
| TC_07         | Weryfikacja odporności transmisji na zakłócenia zewnętrzne.                                                      | 1. W tle odtwórz losowy hałas lub muzykę.<br/> 2. Uruchom emisję sygnału dźwiękowego z wiadomością.<br/> 3. Spróbuj odbierać sygnał na drugim urządzeniu.                                  | Aplikacja odbiera sygnał i przekształca go z powrotem na tekst z minimalnymi błędami lub aplikacja informuje o niemożności odbioru z powodu zakłóceń. |
| TC_08         | Sprawdzenie zachowania aplikacji przy 256 znakach długości wiadomości                                            | 1. Wpisz wiadomość o długości 256 znaków.<br/> 2. Uruchom emisję sygnału dźwiękowego.                                                                                                      | Aplikacja prawidłowo przekształca całą wiadomość na dźwięk i emituje bez błędów.                                                                      |
| TC_09         | Sprawdzenie funkcji aplikacji w warunkach różnych poziomów głośności emisji.                                     | 1. Ustaw różne poziomy głośności urządzenia emitującego.<br/> 2. Wpisz wiadomość i uruchom emisję.<br/> 3. Spróbuj odbierać sygnał na drugim urządzeniu.                                   | Sygnał dźwiękowy jest prawidłowo odbierany na różnych poziomach głośności, zgodnie z możliwościami mikrofonu urządzenia odbierającego.                |
| TC_10         | Testowanie zdolności aplikacji do przekształcania sygnału dźwiękowego na tekst w obecności wielu źródeł dźwięku. | 1. Uruchom emisję sygnału dźwiękowego z wiadomością w środowisku z innymi działającymi aplikacjami dźwiękowymi.<br/> 2. Spróbuj odbierać sygnał na drugim urządzeniu.                      | Aplikacja filtruje nieistotne dźwięki i poprawnie przekształca odbierany sygnał na tekst.                                                             |

## Technologie i narzędzia użyte do projektu

1. Dart

2. Flutter

3. ChatGPT (Pomoc przy tworzeniu widoku aplikacji)