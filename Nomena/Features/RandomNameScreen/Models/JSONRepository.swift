protocol JSONRepository {
    func fetch(from: String) throws(RepositoryError) -> NameList
}


