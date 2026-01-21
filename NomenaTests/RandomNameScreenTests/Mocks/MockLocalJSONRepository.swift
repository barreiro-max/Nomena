import Foundation
@testable import Nomena

struct MockLocalJSONRepository: JSONRepository {
    func fetch(from: String) throws(RepositoryError) -> NameList {
        let sampleJSON = """
        {
          "male_names": [
            "Борис",
            "Валентин",
            "Валерій"
          ],
          "female_names": [
            "Владислава",
            "Володимира",
            "Галина"
          ]
        }
        """

        guard let sampleJSONData = sampleJSON.data(using: .utf8)
        else { throw .dataReadFailed }
        
        do {
            let names = try JSONDecoder().decode(NameList.self, from: sampleJSONData)
            return names
        } catch {
            throw .decodingFailed(error)
        }
    }
}
