//
//  Constants.swift
//  ARs
//
//  Created by Nuradinov Adil on 14/04/23.
//

import Foundation

struct Constants {
    struct Identifiers {
        static let eventCollectionViewCell = "EventCollectionViewCell"
        static let eventsTableViewCell = "EventsTableViewCell"
        static let typeOfEventCollectionViewCell = "TypeOfEventCollectionViewCell"
        static let imageOfEventCollectionViewCell = "ImageOfEventCollectionViewCell"
        static let workingHoursTableViewCell = "WorkingHoursTableViewCell"
        static let cityTableViewCell = "CityTableViewCell"
        static let priceCollectionViewCell = "PriceCollectionViewCell"
        static let ticketCollectionViewCell = "TicketCollectionViewCell"
        static let hotelCollectionViewCell = "HotelCollectionViewCell"
        static let restaurantCollectionViewCell = "RestaurantCollectionViewCell"
        static let reviewsTableViewCell = "ReviewsTableViewCell"
    }
    
    struct Values {
        static let daysOfWork = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        static let workingTime = ["10:00-18:00", "10:00-18:00", "10:00-18:00", "10:00-18:00", "10:00-18:00", "Weekend", "Weekend"]
        static let cities = ["Trento", "Rome", "Milano", "Florence", "Napoli", "Venice", "Torino", "Bologna", "Genova", "Bolzano"]
        static let museImages = ["muse1", "muse2", "muse3", "muse4", "muse5"]
        static let days = ["M", "T", "W", "T", "F", "S", "S"]
        static let prices = [10, 10, 10, 10, 13, 17, 17]
        static let positiveNumbers = prices.filter { $0 > 0 }
        static let minPrice = positiveNumbers.min() ?? 0
        static let maxPrice = positiveNumbers.max() ?? 0
        
        static let artObjects: [String:String] = ["Mona Lisa":"The Mona Lisa is a portrait painting by the Italian Renaissance artist Leonardo da Vinci. The painting depicts a seated woman, believed to be Lisa Gherardini, who was the wife of a Florentine cloth merchant. The painting is renowned for its enigmatic smile and the subtle gradations of light and shadow that Leonardo achieved using a technique called sfumato. It is one of the most famous paintings in the world and is housed at the Louvre Museum in Paris.", "Girl with a Pearl Earring":"Girl with a Pearl Earring is a portrait painting by the Dutch artist Johannes Vermeer, created around 1665. The painting depicts a young woman wearing an exotic dress and a pearl earring. The identity of the model and the reason for the painting are not known for certain. The painting is renowned for its masterful use of light, color, and composition, and has been called the Mona Lisa of the North. It is considered one of Vermeer's greatest works and is housed at the Mauritshuis museum in The Hague, Netherlands."]
    }
    
    static let museums = ["MUSEO EGIZIO, TURIN", "VENARIA REALE, TURIN", "CENACOLO VINCIANO, MILAN", "GALLERIA PALATINA, FLORENCE", "CIRCUITO MUSEALE BOBOLI E ARGENTI, FLORENCE", "GALLERIA DEGLI UFFIZI, FLORENCE", "GALLERIE DELL’ACCADEMIA, FLORENCE", "GALLERIA BORGHESE, ROME", "VILLA D’ESTE, ROME (TIVOLI)", "COLOSSEUM, ROME", "CASTEL SANT’ANGELO, ROME", "MUSEO NAZIONALE, ROME", "MUSEO ARCHEOLOGICO NAZIONALE, NAPLES", "POMPEII, NAPLES", "REGGIA DI CASERTA, CASERTA"]
    static let images = [["EGIZIO1", "EGIZIO2", "EGIZIO3", "EGIZIO4", "EGIZIO5"], ["VENARIA1", "VENARIA2", "VENARIA3", "VENARIA4", "VENARIA5"], ["muse1", "muse2", "muse3", "muse4", "muse5"], ["EGIZIO1", "EGIZIO2", "EGIZIO3", "EGIZIO4", "EGIZIO5"], ["VENARIA1", "VENARIA2", "VENARIA3", "VENARIA4", "VENARIA5"], ["muse1", "muse2", "muse3", "muse4", "muse5"], ["EGIZIO1", "EGIZIO2", "EGIZIO3", "EGIZIO4", "EGIZIO5"], ["VENARIA1", "VENARIA2", "VENARIA3", "VENARIA4", "VENARIA5"], ["muse1", "muse2", "muse3", "muse4", "muse5"], ["EGIZIO1", "EGIZIO2", "EGIZIO3", "EGIZIO4", "EGIZIO5"], ["VENARIA1", "VENARIA2", "VENARIA3", "VENARIA4", "VENARIA5"], ["muse1", "muse2", "muse3", "muse4", "muse5"], ["EGIZIO1", "EGIZIO2", "EGIZIO3", "EGIZIO4", "EGIZIO5"], ["VENARIA1", "VENARIA2", "VENARIA3", "VENARIA4", "VENARIA5"], ["muse1", "muse2", "muse3", "muse4", "muse5"]]
    static let arts = ["Mona Lisa", "Girl with a Pearl Earring"]
    static let timeFrom = ["10:00 AM", "12:00 AM", "2:00 PM"]
    static let timeTo = ["12:00 AM", "2:00 PM", "4:00 PM"]
    static let dates = ["31 MAY 2023", "10 JUNE 2023", "17 JULY 2023"]
    static let hotels = ["B&B Hotel Trento", "Be Place", "Hotel Everest", "Hi Hotel - Wellness & Spa", "Villa Bertagnolli - Locanda Del Bel Sorriso", "B&B Hotel Trento", "Be Place", "Hotel Everest", "Hi Hotel - Wellness & Spa", "Villa Bertagnolli - Locanda Del Bel Sorriso"]
    static let hotelImages = ["bandb", "be place", "everest", "hi hotel", "villa", "bandb", "be place", "everest", "hi hotel", "villa"]
    static let hotelRanks = [4.3, 4.6, 3.9, 4.3, 3.9, 4.3, 4.6, 3.9, 4.3, 3.9]
    static let numberOfReviews = [2056, 1345, 6209, 1094, 699, 2056, 1345, 6209, 1094, 699]
    static let hotelPrices = [67, 141, 72, 70, 103, 67, 141, 72, 70, 103]
    static let restaurants = ["Ristorante Pizzeria Aroma di Trento", "Soul Kitchen Street cuisine", "Augurio Ristorante - Trento", "Osteria a le Due Spade", "Shi's Trento Restorante", "Ristorante Pizzeria Aroma di Trento", "Soul Kitchen Street cuisine", "Augurio Ristorante - Trento", "Osteria a le Due Spade", "Shi's Trento Restorante"]
    static let restImages = ["rest1", "rest2", "rest3", "rest4", "shi", "rest1", "rest2", "rest3", "rest4", "shi"]
    static let authorName = ["Leonardo da Vinci", "Marco Polo", "Christopher Columbus"]
    static let authorAvatar = ["Mona Lisa", "Marco", "Chris"]
    static let postContent = ["I recently had the pleasure of dining, and one of the highlights of my visit was trying their Aperol cocktail. As a fan of vibrant and zesty flavors, I couldn't resist indulging in this classic Italian aperitif. Let me share my delightful experience!", "Consigliato, i fritti sono meglio di molti ayce, pesce molto buono e di buona qualità, il crudo è ottimo, la scelta è abbastanza vasta, peccato non si possano ordinare le salse a parte. Il servizio è rapido anche se il locale risulta abbastanza pieno, camerieri con mascherina e guanti. Atmosfera piacevole e locale ben curato, forse musica leggermente alta. Sicuramente ci ritornerò.", "A gem of a Michelin rated restaurant with nice food, amazing service, and a great selection of wines. We enjoyed lunch and dinner while staying in their lovely boutique Airbnb. Angela and Walter owners and Carmen our breakfast server, are amazing and so hospitable!"]
    static let post = ["aperol", "sushi", "pasta"]
}

enum TypesOfEvents: String, CaseIterable {
    case all = "✅ All"
    case theater = "🎭 Theatre"
    case museum = "🕍 Museum"
    case music = "🎵 Music"
    case art = "🎨 Art"
}
