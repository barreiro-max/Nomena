import Observation

@MainActor
@Observable final class RandomNameViewModel {
    var currentCard: NamedCard?
    var errorMessage: String?
    var isLoading: Bool = false
    
    private let loader: LoaderUseCase
    
    @ObservationIgnored
    private(set) var names: [String]
    
    init(
        currentCard: NamedCard,
        loader: LoaderUseCase,
        names: [String]
    ) {
        self.currentCard = currentCard
        self.loader = loader
        self.names = names
    }
    
    func fetchNames() {
        isLoading = true
        defer { isLoading = false }
        do {
            names = try loader.execute()
            errorMessage = nil
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func changeCard() {
        let randomName = names.randomElement() ?? "Імʼя відсутнє"
        currentCard = .init(name: randomName)
    }
}
