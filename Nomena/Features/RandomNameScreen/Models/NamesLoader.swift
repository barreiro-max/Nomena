protocol LoaderUseCase {
    func execute() throws -> [String]
}

struct NamesLoader: LoaderUseCase {
    private let repository: JSONRepository
    init(repository: JSONRepository) {
        self.repository = repository
    }
    
    func execute() throws -> [String] {
        let nameList = try repository.fetch(from: "names.json")
        return nameList.male + nameList.female
    }
}
