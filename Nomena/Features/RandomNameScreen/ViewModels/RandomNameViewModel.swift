import Observation

@MainActor
@Observable final class RandomNameViewModel {
    var errorMessage: String?
    private(set) var isLoading: Bool = false
    
    private let loader: LoaderUseCase
    
    private(set) var names: [String]
    
    init(
        loader: LoaderUseCase,
        names: [String] = []
    ) {
        self.loader = loader
        self.names = names
    }
    
    func loadNames() async {
        isLoading = true
        defer { isLoading = false }
        do throws(RepositoryError) {
            names = try await loader.execute()
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func randomCardName() -> String {
        return names.randomElement() ?? "Імʼя відсутнє"
    }
}
