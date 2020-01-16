import UIKit

// Enumerations







enum WeatherType {
    case sun
    case cloud
    case rain
    case wind
    case snow
}

func getHaterStatus(weather: WeatherType) -> String? {
    if weather == .sun {
        return nil
    } else {
        return "Hate"
    }
}

getHaterStatus(weather: .cloud)


// Enums with additional values


enum WeatherType2 {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}


func getHaterStatus2(weather: WeatherType2) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}

getHaterStatus2(weather: WeatherType2.wind(speed: 5))

