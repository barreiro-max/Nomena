import Foundation

struct LocalJSONRepository: JSONRepository {
    func fetch(from filename: String) throws(RepositoryError) -> NameList {
        guard let namesJSONURL = Bundle.main.url(
            forResource: "names",
            withExtension: "json")
        else { throw .fileNotFound }

        guard let namesJSONData = try? Data(contentsOf: namesJSONURL)
        else { throw .dataReadFailed }
        
        do {
            let names = try JSONDecoder().decode(NameList.self, from: namesJSONData)
            return names
        } catch {
            throw .decodingFailed(error)
        }
    }
}
