import Foundation

struct LocalJSONRepository: JSONRepository {
    func fetch(from filename: String) throws(RepositoryError) -> NameList {
        let resource = filename.split(separator: ".")
        let basename = String(resource[0])
        let fileExtension = String(resource[resource.count - 1])

        guard let namesJSONURL = Bundle.main.url(
            forResource: basename,
            withExtension: fileExtension)
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
