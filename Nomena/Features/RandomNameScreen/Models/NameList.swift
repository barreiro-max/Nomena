struct NameList: Decodable {
    let male: [String]
    let female: [String]
    
    enum CodingKeys: String, CodingKey {
        case male = "male_names"
        case female = "female_names"
    }
}

