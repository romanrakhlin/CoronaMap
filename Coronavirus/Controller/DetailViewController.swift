//
//  DetailViewController.swift
//  Coronavirus
//
//  Created by Roman Rakhlin on 22.03.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import UIKit
import FloatingPanel
import CoreLocation

class DetailViewController: UIViewController {
    
    var feature: Feature?
    
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var updateLabel: UILabel!
    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(catchNotification(notification:)), name: .tappedAnnotation, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let feature = feature {
            
            setFeature(feature: feature)
        }
    }
    
    @objc func catchNotification(notification: Notification) -> Void {
        if let info = notification.userInfo, let feature = info["feature"] as? Feature {
            setFeature(feature: feature)
        }
    }
    
    func setFeature(feature: Feature) {
        regionLabel.text = feature.attributes.Country_Region
        confirmedLabel.text = String(feature.attributes.Confirmed)
        deathsLabel.text = String(feature.attributes.Deaths)
        recoveredLabel.text = String(feature.attributes.Recovered)
        
        let date = feature.date()
        print(feature.attributes.Last_Update)
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "MMddyyyyhhmm", options: 0, locale: Locale.current)
        updateLabel.text = "Последнее обновление " + formatter.string(from: date)
        
        if feature.administrativeArea != nil || feature.subAdministrativeArea != nil {
            return
        }
        
        let geocoder = CLGeocoder()
        let location = CLLocation.init(latitude: feature.attributes.Lat, longitude: feature.attributes.Long_)
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let placemarks = placemarks {
                if let pm = placemarks.first, let country = pm.country, let administrative = pm.administrativeArea {
                    DispatchQueue.main.async {
                        // локализация :)
                        if feature.attributes.Country_Region.contains("China") {
                            self.regionLabel.text = "Китай"
                        } else if feature.attributes.Country_Region.contains("Finland") {
                            self.regionLabel.text =  "Финляндия"
                        } else if feature.attributes.Country_Region.contains("Central African Republic") {
                            self.regionLabel.text =  "Центральноафриканская Республика"
                        } else if feature.attributes.Country_Region.contains("France") {
                            self.regionLabel.text =  "Франция, "
                        } else if feature.attributes.Country_Region.contains("United Kingdom") {
                            self.regionLabel.text =  "Великобритания"
                        } else if feature.attributes.Country_Region.contains("North Macedonia") {
                            self.regionLabel.text =  "Македония"
                        } else if feature.attributes.Country_Region.contains("Philippines") {
                            self.regionLabel.text =  "Филиппины"
                        } else if feature.attributes.Country_Region.contains("Cyprus") {
                            self.regionLabel.text =  "Кипр"
                        } else if feature.attributes.Country_Region.contains("Nepal") {
                            self.regionLabel.text =  "Непал"
                        } else if feature.attributes.Country_Region.contains("US") {
                            self.regionLabel.text =  "США"
                        } else if feature.attributes.Country_Region.contains("Fiji") {
                            self.regionLabel.text = "Фиджи"
                        } else if feature.attributes.Country_Region.contains("Greece") {
                            self.regionLabel.text = "Греция"
                        } else if feature.attributes.Country_Region.contains("Namibia") {
                            self.regionLabel.text = "Намибия"
                        } else if feature.attributes.Country_Region.contains("Honduras") {
                            self.regionLabel.text = "Гондурас"
                        } else if feature.attributes.Country_Region.contains("Venezuela") {
                            self.regionLabel.text = "Венесуэла"
                        } else if feature.attributes.Country_Region.contains("Tunisia") {
                            self.regionLabel.text = "Тунис"
                        } else if feature.attributes.Country_Region.contains("Bangladesh") {
                            self.regionLabel.text = "Бангладеш"
                        } else if feature.attributes.Country_Region.contains("Angola") {
                            self.regionLabel.text = "Ангола"
                        } else if feature.attributes.Country_Region.contains("Barbados") {
                            self.regionLabel.text = "Барбадос"
                        } else if feature.attributes.Country_Region.contains("Switzerland") {
                            self.regionLabel.text = "Швейцария"
                        } else if feature.attributes.Country_Region.contains("Colombia") {
                            self.regionLabel.text = "Колумбия"
                        } else if feature.attributes.Country_Region.contains("Seychelles") {
                            self.regionLabel.text = "Сейшелы"
                        } else if feature.attributes.Country_Region.contains("Kyrgyzstan") {
                            self.regionLabel.text = "Киргизия"
                        } else if feature.attributes.Country_Region.contains("United Arab Emiratesd") {
                            self.regionLabel.text = "Объединенные Арабские Эмираты"
                        } else if feature.attributes.Country_Region.contains("Tanzania") {
                            self.regionLabel.text = "Танзания"
                        } else if feature.attributes.Country_Region.contains("Panama") {
                            self.regionLabel.text = "Панама"
                        } else if feature.attributes.Country_Region.contains("Thailand") {
                            self.regionLabel.text = "Таиланд"
                        } else if feature.attributes.Country_Region.contains("Vietnam") {
                            self.regionLabel.text = "Вьетнам"
                        } else if feature.attributes.Country_Region.contains("Guinea") {
                            self.regionLabel.text = "Гвинея"
                        } else if feature.attributes.Country_Region.contains("Ukraine") {
                            self.regionLabel.text = "Украина"
                        } else if feature.attributes.Country_Region.contains("Spain") {
                            self.regionLabel.text = "Испания"
                        } else if feature.attributes.Country_Region.contains("Italy") {
                            self.regionLabel.text = "Италия"
                        } else if feature.attributes.Country_Region.contains("Eswatini") {
                            self.regionLabel.text = "Эсватини"
                        } else if feature.attributes.Country_Region.contains("Australia") {
                            self.regionLabel.text = "Австралия"
                        } else if feature.attributes.Country_Region.contains("Canada") {
                            self.regionLabel.text = "Канада"
                        } else if feature.attributes.Country_Region.contains("Congo (Brazzaville)") {
                            self.regionLabel.text = "ДР Конго"
                        } else if feature.attributes.Country_Region.contains("Argentina") {
                            self.regionLabel.text = "Аргентина"
                        } else if feature.attributes.Country_Region.contains("Dominican Republic") {
                            self.regionLabel.text = "Доминиканская Республика"
                        } else if feature.attributes.Country_Region.contains("Bosnia and Herzegovina") {
                            self.regionLabel.text = "Босния и Герцеговина"
                        } else if feature.attributes.Country_Region.contains("Slovakia") {
                            self.regionLabel.text = "Словакия"
                        } else if feature.attributes.Country_Region.contains("South Africa") {
                            self.regionLabel.text = "Южная Африка"
                        } else if feature.attributes.Country_Region.contains("Malaysia") {
                            self.regionLabel.text = "Малайзия"
                        } else if feature.attributes.Country_Region.contains("Zambia") {
                            self.regionLabel.text = "Замбия"
                        } else if feature.attributes.Country_Region.contains("Morocco") {
                            self.regionLabel.text = "Марокко"
                        } else if feature.attributes.Country_Region.contains("Mayotte") {
                            self.regionLabel.text = "Майотта"
                        } else if feature.attributes.Country_Region.contains("Paraguay") {
                            self.regionLabel.text = "Парагвай"
                        } else if feature.attributes.Country_Region.contains("Kazakhstan") {
                            self.regionLabel.text = "Казахстан"
                        } else if feature.attributes.Country_Region.contains("Romania") {
                            self.regionLabel.text = "Румыния"
                        } else if feature.attributes.Country_Region.contains("Togo") {
                            self.regionLabel.text = "Того"
                        } else if feature.attributes.Country_Region.contains("Ecuador") {
                            self.regionLabel.text = "Эквадор"
                        } else if feature.attributes.Country_Region.contains("Russia") {
                            self.regionLabel.text = "Россия"
                        } else if feature.attributes.Country_Region.contains("Saint Lucia") {
                            self.regionLabel.text = "Сент-Люсия"
                        } else if feature.attributes.Country_Region.contains("Gabon") {
                            self.regionLabel.text = "Габон"
                        } else if feature.attributes.Country_Region.contains("Sri Lanka") {
                            self.regionLabel.text = "Шри-Ланка"
                        } else if feature.attributes.Country_Region.contains("Denmark") {
                            self.regionLabel.text = "Дания"
                        } else if feature.attributes.Country_Region.contains("Iraq") {
                            self.regionLabel.text = "Ирак"
                        } else if feature.attributes.Country_Region.contains("Congo (Kinshasa)a") {
                            self.regionLabel.text = "ДР Конго"
                        } else if feature.attributes.Country_Region.contains("Saudi Arabiaa") {
                            self.regionLabel.text = "Саудовская Аравия"
                        } else if feature.attributes.Country_Region.contains("Sweden") {
                            self.regionLabel.text = "Швеция"
                        } else if feature.attributes.Country_Region.contains("Jordan") {
                            self.regionLabel.text = "Иордания"
                        } else if feature.attributes.Country_Region.contains("Israel") {
                            self.regionLabel.text = "Израиль"
                        } else if feature.attributes.Country_Region.contains("Latvia") {
                            self.regionLabel.text = "Латвия"
                        } else if feature.attributes.Country_Region.contains("El Salvador") {
                            self.regionLabel.text = "Сальвадор"
                        } else if feature.attributes.Country_Region.contains("Bolivia") {
                            self.regionLabel.text = "Боливия"
                        } else if feature.attributes.Country_Region.contains("Qatar") {
                            self.regionLabel.text = "Катар"
                        } else if feature.attributes.Country_Region.contains("Gambia, The") {
                            self.regionLabel.text = "Словакия"
                        } else if feature.attributes.Country_Region.contains("Indonesia") {
                            self.regionLabel.text = "Индонезия"
                        } else if feature.attributes.Country_Region.contains("Algeria") {
                            self.regionLabel.text = "Алжир"
                        } else if feature.attributes.Country_Region.contains("Uganda") {
                            self.regionLabel.text = "Уганда"
                        } else if feature.attributes.Country_Region.contains("Nicaragua") {
                            self.regionLabel.text = "Никарагуа"
                        } else if feature.attributes.Country_Region.contains("Belgium") {
                            self.regionLabel.text = "Бельгия"
                        } else if feature.attributes.Country_Region.contains("Guatemala") {
                            self.regionLabel.text = "Гватемала"
                        } else if feature.attributes.Country_Region.contains("Afghanistan") {
                            self.regionLabel.text = "Афганистан"
                        } else if feature.attributes.Country_Region.contains("Andorra") {
                            self.regionLabel.text = "Андорра"
                        } else if feature.attributes.Country_Region.contains("Japan") {
                            self.regionLabel.text = "Япония"
                        } else if feature.attributes.Country_Region.contains("Iran") {
                            self.regionLabel.text = "Иран"
                        } else if feature.attributes.Country_Region.contains("Equatorial Guinea") {
                            self.regionLabel.text = "Экваториальная Гвинея"
                        } else if feature.attributes.Country_Region.contains("Iceland") {
                            self.regionLabel.text = "Исландия"
                        } else if feature.attributes.Country_Region.contains("Brazil") {
                            self.regionLabel.text = "Бразилия"
                        } else if feature.attributes.Country_Region.contains("Czechia") {
                            self.regionLabel.text = "Чехия"
                        } else if feature.attributes.Country_Region.contains("Slovenia") {
                            self.regionLabel.text = "Словения"
                        } else if feature.attributes.Country_Region.contains("Ethiopia") {
                            self.regionLabel.text = "Эфиопия"
                        } else if feature.attributes.Country_Region.contains("Poland") {
                            self.regionLabel.text = "Польша"
                        } else if feature.attributes.Country_Region.contains("Mauritania") {
                            self.regionLabel.text = "Мавритания"
                        } else if feature.attributes.Country_Region.contains("Austria") {
                            self.regionLabel.text = "Австрия"
                        } else if feature.attributes.Country_Region.contains("Nigeria") {
                            self.regionLabel.text = "Нигерия"
                        } else if feature.attributes.Country_Region.contains("Jamaica") {
                            self.regionLabel.text = "Ямайка"
                        } else if feature.attributes.Country_Region.contains("Brunei") {
                            self.regionLabel.text = "Бруней"
                        } else if feature.attributes.Country_Region.contains("Netherlands") {
                            self.regionLabel.text = "Нидерланды"
                        } else if feature.attributes.Country_Region.contains("Bulgaria") {
                            self.regionLabel.text = "Болгария"
                        } else if feature.attributes.Country_Region.contains("Azerbaijan") {
                            self.regionLabel.text = "Азербайджан"
                        } else if feature.attributes.Country_Region.contains("Serbia") {
                            self.regionLabel.text = "Сербия"
                        } else if feature.attributes.Country_Region.contains("India") {
                            self.regionLabel.text = "Индия"
                        } else if feature.attributes.Country_Region.contains("Pakistan") {
                            self.regionLabel.text = "Пакистан"
                        } else if feature.attributes.Country_Region.contains("Kosovo") {
                            self.regionLabel.text = "Косово"
                        } else if feature.attributes.Country_Region.contains("Sudan") {
                            self.regionLabel.text = "Судан"
                        } else if feature.attributes.Country_Region.contains("Cuba") {
                            self.regionLabel.text = "Куба"
                        } else if feature.attributes.Country_Region.contains("Moldova") {
                            self.regionLabel.text = "Молдавия"
                        } else if feature.attributes.Country_Region.contains("Somalia") {
                            self.regionLabel.text = "Сомали"
                        } else if feature.attributes.Country_Region.contains("Turkey") {
                            self.regionLabel.text = "Турция"
                        } else if feature.attributes.Country_Region.contains("Malta") {
                            self.regionLabel.text = "Мальта"
                        } else if feature.attributes.Country_Region.contains("Reunion") {
                            self.regionLabel.text = "Реюньон"
                        } else if feature.attributes.Country_Region.contains("Kenya") {
                            self.regionLabel.text = "Кения"
                        } else if feature.attributes.Country_Region.contains("Cote d'Ivoire") {
                            self.regionLabel.text = "Кот-д'Ивуар"
                        } else if feature.attributes.Country_Region.contains("Portugal") {
                            self.regionLabel.text = "Португалия"
                        } else if feature.attributes.Country_Region.contains("Timor-Leste") {
                            self.regionLabel.text = "Восточный Тимор"
                        } else if feature.attributes.Country_Region.contains("Albania") {
                            self.regionLabel.text = "Албания"
                        } else if feature.attributes.Country_Region.contains("Madagascar") {
                            self.regionLabel.text = "Мадагаскар"
                        } else if feature.attributes.Country_Region.contains("Costa Rica") {
                            self.regionLabel.text = "Коста-Рика"
                        } else if feature.attributes.Country_Region.contains("Liechtenstein") {
                            self.regionLabel.text = "Лихтенштейн"
                        } else if feature.attributes.Country_Region.contains("Cambodia") {
                            self.regionLabel.text = "Камбоджа"
                        } else if feature.attributes.Country_Region.contains("Eritrea") {
                            self.regionLabel.text = "Эритрея"
                        } else if feature.attributes.Country_Region.contains("Peru") {
                            self.regionLabel.text = "Перу"
                        } else if feature.attributes.Country_Region.contains("Ireland") {
                            self.regionLabel.text = "Ирландия"
                        } else if feature.attributes.Country_Region.contains("Egypt") {
                            self.regionLabel.text = "Египет"
                        } else if feature.attributes.Country_Region.contains("Liberia") {
                            self.regionLabel.text = "Либерия"
                        } else if feature.attributes.Country_Region.contains("Chad") {
                            self.regionLabel.text = "Чад"
                        } else if feature.attributes.Country_Region.contains("Burkina Faso") {
                            self.regionLabel.text = "Буркина-Фасо"
                        } else if feature.attributes.Country_Region.contains("Maldives") {
                            self.regionLabel.text = "Мальдивы"
                        } else if feature.attributes.Country_Region.contains("Papua New Guinea") {
                            self.regionLabel.text = "Папуа-Новая Гвинея"
                        } else if feature.attributes.Country_Region.contains("Mexico") {
                            self.regionLabel.text = "Мексика"
                        } else if feature.attributes.Country_Region.contains("Rwanda") {
                            self.regionLabel.text = "Руанда"
                        } else if feature.attributes.Country_Region.contains("Croatia") {
                            self.regionLabel.text = "Хорватия"
                        } else if feature.attributes.Country_Region.contains("Benin") {
                            self.regionLabel.text = "Бенин"
                        } else if feature.attributes.Country_Region.contains("Haiti") {
                            self.regionLabel.text = "Гаити"
                        } else if feature.attributes.Country_Region.contains("Montenegro") {
                            self.regionLabel.text = "Черногория"
                        } else if feature.attributes.Country_Region.contains("Bhutan") {
                            self.regionLabel.text = "Бутан"
                        } else if feature.attributes.Country_Region.contains("Mauritius") {
                            self.regionLabel.text = "Маврикий"
                        } else if feature.attributes.Country_Region.contains("Martinique") {
                            self.regionLabel.text = "Мартиника"
                        } else if feature.attributes.Country_Region.contains("Guyana") {
                            self.regionLabel.text = "Гайана"
                        } else if feature.attributes.Country_Region.contains("Belarus") {
                            self.regionLabel.text = "Беларусь"
                        } else if feature.attributes.Country_Region.contains("Niger") {
                            self.regionLabel.text = "Нигер"
                        } else if feature.attributes.Country_Region.contains("Lithuania") {
                            self.regionLabel.text = "Литва"
                        } else if feature.attributes.Country_Region.contains("Oman") {
                            self.regionLabel.text = "Оман"
                        } else if feature.attributes.Country_Region.contains("Bahrain") {
                            self.regionLabel.text = "Бахрейн"
                        } else if feature.attributes.Country_Region.contains("Senegal") {
                            self.regionLabel.text = "Сенегал"
                        } else if feature.attributes.Country_Region.contains("Antigua and Barbuda") {
                            self.regionLabel.text = "Антигуа и Барбуда"
                        } else if feature.attributes.Country_Region.contains("Cameroon") {
                            self.regionLabel.text = "Камерун"
                        } else if feature.attributes.Country_Region.contains("Luxembourg") {
                            self.regionLabel.text = "Люксембург"
                        } else if feature.attributes.Country_Region.contains("Estonia") {
                            self.regionLabel.text = "Эстония"
                        } else if feature.attributes.Country_Region.contains("Monaco") {
                            self.regionLabel.text = "Монако"
                        } else {
                            self.regionLabel.text = country
                        }
                    }
                }
            }
        }
    }
}
