protocol LoaderUseCase {
    func execute() async throws(RepositoryError) -> [String]
}

struct NamesLoader: LoaderUseCase {
    private let repository: JSONRepository
    init(repository: JSONRepository) {
        self.repository = repository
    }
    
    func execute() async throws(RepositoryError) -> [String] {
        let nameList = try await repository.fetch(from: "names.json")
        return nameList.male + nameList.female
    }
}
