protocol JSONRepository {
    func fetch(from: String) async throws(RepositoryError) -> NameList
}


