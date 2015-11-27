import Foundation

class HistoryTreasure: Treasure {
    let year: Int
    
    init(name: String, year: Int, latitude: Double, longitude: Double) {
        self.year = year
        let location = GeoLocation(latitude: latitude, longitude: longitude)
        
        super.init(name: name, location: location)
    }
}

class FactTreasure: Treasure {
    let fact: String
    
    init(name: String, fact: String, latitude: Double, longitude: Double) {
        self.fact = fact
        let location = GeoLocation(latitude: latitude, longitude: longitude)
        
        super.init(name: name, location: location)
    }
}