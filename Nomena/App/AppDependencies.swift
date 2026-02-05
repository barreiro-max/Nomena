import Observation

@MainActor
final class AppDependencies {
    private lazy var repository: JSONRepository = LocalJSONRepository()
    private lazy var loader: LoaderUseCase = {
        NamesLoader(repository: repository)
    }()
    
    func makeViewModel() -> RandomNameViewModel {
        RandomNameViewModel(loader: loader)
    }
}
