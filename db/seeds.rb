# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rails.logger = Logger.new(STDOUT)
logger = Rails.logger
Information::Block.destroy_all
Information::Tile.destroy_all
logger.info { 'Reseeding database...' }

User.destroy_all
User.create!(email: '', password: '')

[[
    'Kim jesteśmy, czym się zajmujemy?', 
    'Pochodzimy z Gdańska i to tu mieści się siedziba naszej firmy. Działamy przede wszystkim w naszym rodzinnym mieście i okolicach, jednak nie boimy się wyzwań i chętnie poszerzamy zakres terytorialny naszej działalności. Jesteśmy energicznie rozwijającą się firmą z wieloletnim doświadczeniem. Naszą misją jest wdrażanie innowacyjnych metod czyszczenia i dezynfekowania pomieszczeń i obiektów, aby jak najlepiej spełniać wymagania naszych klientów. Wierzymy w przyszłość nieinwazyjnej i bezpiecznej metody dezynfekcji i dezodoryzacji, jaką jest ozonowanie. Jesteśmy przekonani, że rosnąca w społeczeństwie świadomość w temacie zdrowego i ekologicznego stylu życia będzie powodowała coraz bardziej dynamiczny wzrost zapotrzebowania na czyszczenie powierzchni oraz powietrza. Popularyzacja ozonowania jest naszym celem, któremu od wielu lat bez reszty się oddajemy. Specjalizujemy się w kompleksowym ozonowaniu różnego typu pomieszczeń, od mieszkań po szpitale i hotele. Zamów ozonowanie już dziś i przekonaj się, jak poprawi się jakość powietrza w Twoim domu!']].each do |title, desc|
    Information::Block.create(title: title, desc: desc, position: 3)
end

[
    ['Czyste powietrze to zdrowe powietrze', 'O ozonowaniu wiemy wszystko. Przeprowadzimy Cię przez bezpieczne ozonowanie dowolnego obiektu. Zajmujemy się profesjonalnym czyszczeniem pomieszczeń, samochodów i obiektów.'],
    ['Co to jest ozonowanie?', 'Ozonowanie to proces polegający na skutecznym eliminowaniu cząsteczek związków aromatycznych pochodzenia organicznego i chemicznego, które odpowiadają za nieprzyjemne zapachy (nie tylko w powietrzu, ale również na powierzchniach). W trakcie ozonowania otoczenie jest dezynfekowane, a po jego zakończeniu – sterylne. Wszystko to bez użycia chemii.'],
    ['Jak działa ozonowanie?', 'Dzięki specyficznym właściwościom ozonu bardzo często używany on jest w zabiegach dezynfekcji i dezodoryzacji. Charakterystyczny, niebieski, cięższy od powietrza gaz, niszczy wirusy i zarodniki przetrwalnikowe, dzięki czemu chętnie wykorzystuje się go podczas dezynfekowania powietrza – specyfika fizyczna gazu pozwala na skuteczne docierania nie tylko we wszystkie zakamarki powierzchni, ale również do mikroszczelin i wnętrza tkanin.']
    ].each do |title, desc| 
        Information::Block.create!(title: title, desc: desc, position: 0)
    end

[    
    ['Ile trwa ozonowanie?', 'Najkrócej trwa ozonowanie klimatyzacji i wnętrza samochodu osobowego – od 30 do 90 minut (w przypadku samochodu ciężarowego jest to ok. 90 – 180 minut). Na ozonowanie pomieszczeń użytkowych lub mieszkań poświęcamy zwykle ok. 2 – 6 godzin, w zależności od powierzchni mieszkalnej oraz stężenia wyprodukowanego ozonu. Zabijanie zarazków ozonem w domu mieszkalnym to ok. 6 – 10 godzin pracy. Domy o ponadprzeciętnie dużej powierzchni, a także obiekty typu: przedszkola, szkoły, hotele, placówki zdrowotne, hotele to zwykle kilka – kilkanaście dni ozonowania.'],
    ['Czy ozon jest bezpieczny dla człowieka?', 'Ozonowanie jest procesem bezpiecznym dla człowieka. Może być szkodliwe tylko w przypadku długotrwałego przebywania i wdychania powietrza w pomieszczeniu o dużym stężeniu ozonu. Ozon ma niską trwałość, więc już po 1 – 2 godzinach po czyszczeniu ozonem pomieszczenie nadaje się do normalnego użytkowania. Możesz jedynie czuć zapach przypominający zapach po burzy, który nie ma jednak żadnego wpływu na Twoje zdrowie.']
].each do |title, desc| 
    Information::Block.create!(title: title, desc: desc, position: 1)
end

[
    'Ozon najskuteczniej ze wszystkich dostępnych środków eliminuje bakterie, pleśń i inne drobnoustroje. Bez trudu dociera nawet do trudno dostępnych miejsc, szczelin, wnętrz mebli.', 
    'Ozonowanie usuwa nieprzyjemne zapachy – koniec z nieprzyjemną wonią wilgoci, stęchlizny, spalenizny, czy dymu papierosowego. Proces ozonowania pozostawia w powietrzu przyjemny, świeży zapach.',
    'Proces zabijania zarazków ozonem jest szybki i sprawny. Ozon rozpada się błyskawicznie, dzięki czemu niedługo po ozonowaniu przewietrzone pomieszczenie jest gotowe do użytku.',
    'Odpowiednio przeprowadzone ozonowanie jest w pełni bezpieczne dla ludzi i zwierząt. Jest to maksymalnie ekologiczna metoda, nie wpływająca na środowisko w żaden negatywny sposób.',
    'Ozonowanie to ulga dla alergików. Czyszczenie ozonem zapewnia osobom z problemami alergicznymi czystsze i przyjemniejsze warunki pracy lub mieszkalne.'
].each do |desc| 
    Information::Tile.create!(desc: desc)
end


#Service.destroy_all
#Service::Tile.destroy_all
#Contact::Block.destroy_all
# Pricing::Benefit.destroy_all
# Pricing::Main.destroy_all
#Pricing::Feature.destroy_all

# Pricing::Benefit.create(title: "Analiza", traits: 'Diagnoza problemu, Wycena') do |b|

# end
# Pricing::Benefit.create(title: "Przygotowanie", traits: 'Zabezpieczenie budynku, Instalacja sprzetu') do |b|

# end
# Pricing::Benefit.create(title: "Dojazd", traits: 'Szybka reakcja, Darmowy dojazd') do |b|

# end
# Pricing::Benefit.create(title: "Certyfikat", traits: 'Natychmiastowa reakcja, Województwo Pomorskie') do |b|

# end

# Pricing::Feature.create(title: '<strong>NOWOŚĆ</strong> - Ozonowanie obuwia', desc: 'Przywracamy świeżość oraz pozbywamy się bakterii z używanych butów', subtext: 'Każda kolejna para - 10 zł', traits: '1 para - <strong>20 zł</strong><br>2 pary - <strong>40 zł</strong><br>3 pary - <strong>55 zł</strong><br>4 pary - <strong>60 zł</strong>') do |b|

# end
# [
#  ['Kompleksowość', 'W naszej ofercie znajdziesz zabijanie zarazków ozonem w różnych typach pomieszczeń, zarówno prywatnych, jak i firm i instytucji państwowych.'],
#  ['Bezpłatny dojazd', 'Nie tylko na samo ozonowanie, ale również na konsultację.'],
#  ['Szybka usługa', 'zdajemy sobie sprawę, że w przypadku higieny czas na ma olbrzymie znaczenie. Działamy tak szybko, jak tylko to możliwe, abyś jak najszybciej mógł cieszyć się świeżym, czystym powietrzem. Większość zleceń realizujemy w ciągu 24 godzin od przyjęcia zgłoszenia.'],
#  ['Gwarancja skuteczności', 'Realizowane usługi są objęte gwarancją skuteczności. Zapytaj o szczegóły naszych konsultantów. Zajrzyj na nasze referencje.'],
#  ['Konkurencyjne ceny', 'Skuteczne ozonowanie, ze względu na wysokie koszty sprzętu i jego konserwacji, nie należy do najtańszych usług. Każdą usługę wyceniamy indywidualnie, dbając o to, aby obie strony były usatysfakcjonowane.'],
#  ['Certyfikat', 'Po wykonaniu zlecenia wystawiamy certyfikat bezpieczeństwa oraz gotowości do użytkowania miejsca pracy.']].each do |title, desc|

#  Service::Tile.create(title: title, desc: desc) do |i|

#  end
# end

# Pricing::Main.create(title: "Ozonowanie pomieszczeń", price: '10zł<small>/m2</small>', position: 0) do |b|

# end

# Pricing::Main.create(title: "Ozonowanie pojazdów", price: 'od 80 zł <br> <small>(cena zależna od wielkości pojazdu)</small>', position: 2) do |b|

# end

# User.create!(email: 'example@example.com', password: 'example')

# 10.times do |i|
#  Service.create(
#    title: "Cool service #{i + 1}",
#    desc: "<h1>Hello there im topic</h1 <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel facilisis magna, sit amet pulvinar neque. Phasellus a tortor quis odio tempus fringilla. Ut accumsan iaculis dictum. Pellentesque semper semper mi sed consectetur. Nulla dictum, quam ut facilisis molestie, est odio iaculis neque, ac pharetra orci ipsum eu magna. Integer varius nec diam ut lobortis. Vestibulum sodales felis ligula, at dapibus nisl faucibus sit amet. Etiam semper euismod tempus. Morbi scelerisque blandit volutpat. Sed sagittis velit est. Nam a consectetur arcu, in ullamcorper nibh. Curabitur aliquam turpis et egestas commodo.
#            Nunc in cursus ante. Etiam eu sapien justo. Maecenas ac nunc sapien. Sed nunc augue, malesuada at tortor non, laoreet bibendum urna. Praesent accumsan lacus eu ultricies imperdiet. Suspendisse dignissim blandit sapien sed varius. Vestibulum eget egestas tellus, vel faucibus tortor. Proin auctor id augue quis molestie. Proin finibus, nulla blandit auctor iaculis, orci diam gravida sapien, ut suscipit turpis nibh quis elit. Curabitur in odio nec justo mollis imperdiet et finibus mi. Aenean eu mi at tellus fringilla blandit vel non magna.
#            Sed hendrerit sit amet diam vel consequat. Integer imperdiet nisi sit amet augue maximus maximus. Pellentesque ligula diam, rutrum sit amet mattis nec, scelerisque in augue. Ut sed risus viverra, convallis nisi a, dapibus est. Ut porta lorem non leo facilisis convallis. Vestibulum pretium dui lacus. Morbi sed nulla sapien. Mauris porta nibh arcu, sed placerat ligula gravida eget. Nam faucibus nec ex ac sodales. Phasellus vel nunc cursus, fermentum orci nec, lacinia nisl. Vestibulum et lorem id lacus fermentum rutrum vitae ac massa. Praesent egestas tempus enim vitae gravida. Donec lacinia libero orci, a aliquet nisl iaculis eu.
#            In nisl magna, congue ac velit ut, viverra pharetra nibh. Vestibulum fermentum nibh non elementum dictum. Etiam ultricies maximus nisi, et tempus lorem ornare bibendum. Donec fringilla est augue, sit amet tincidunt dui cursus id. Donec pellentesque risus at dignissim auctor. Proin posuere lacus urna, vitae iaculis urna hendrerit a. Fusce nec erat mi. Fusce a commodo metus.
#            Aliquam vel ligula sit amet orci auctor fermentum vitae ac turpis. Maecenas semper sapien tellus, eu dapibus velit rhoncus vitae. Donec quis fermentum felis. Aliquam sit amet ex magna. Cras congue, arcu vitae efficitur aliquet, leo dui scelerisque diam, in tempus neque dui at risus. Nulla pharetra eros vitae consequat vestibulum. Integer commodo quam mauris, sit amet rutrum arcu rutrum eu. Proin pharetra euismod enim, ut sagittis nunc malesuada at.</p>"
#  ) do |o|
#    o.picture.store!(File.open(Rails.root + "public/images/service.jpg"))
#  end
# end

# Contact::Block.create!(position: 3, title: 'PROGRAM LOJALNOŚCIOWY', desc: 'Zadzwoń do nas, by podjąć współpracę biznesową. Jesteśmy dostępni przez całą dobę, od poniedziałku do piątku. <br> <strong>(+48) 434-343-221</strong>')
# Contact::Block.create!(position: 2, title: 'Bezpłatna konsultacja', desc: 'Oferujemy darmową konsultację, wypełnij formularz kontaktowy. Staramy się odpowiadać na wszystkie zgłoszenia w ciągu 24 godzin. Najczęściej robimy to nawet szybciej. Jeśli wolisz kontakt telefoniczny, skorzystaj z informacji podanych powyżej.')
# Contact::Block.create!(position: 1, title: 'Sytuacja alarmowa', desc: 'Doskonale zdajemy sobie sprawę, że czasem sytuacja wymaga natychmiastowej reakcji. Dlatego dla naszych klientów uruchomiliśmy całodobowy telefon alarmowy, do którego używania zachęcamy w pilnych przypadkach. </br>Zadzwoń pod numer alarmowy:   +48 512144180')
# Contact::Block.create!(position: 0, title: 'Zadzwoń i umów się na spotkanie!', desc: 'Staramy się odpowiadać na wszystkie zgłoszenia w ciągu 24 godzin. Najczęściej robimy to nawet szybciej. </br>Zapytanie możesz wysłać poprzez formularz poniżej. </br> Jeśli wolisz kontakt telefoniczny, skorzystaj z numeru telefonu naszej infolinii. </br>Możesz również wysłać do nas maila na adres skrzynki pocztowej. </br>Telefon:   +48 512144180 </br>Email:   beniamin@ozonexpert.pl')