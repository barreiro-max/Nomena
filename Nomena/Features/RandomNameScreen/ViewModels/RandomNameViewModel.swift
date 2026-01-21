import Observation

@MainActor
@Observable final class RandomNameViewModel {
    var currentCard: NamedCard?
    var errorMessage: String?
    
    private let repository: JSONRepository
    private let loader: LoaderUseCase
    
    @ObservationIgnored
    private(set) var names: [String]
    
    init(
        currentCard: NamedCard,
        repository: JSONRepository,
        loader: LoaderUseCase,
        names: [String]
    ) {
        self.currentCard = currentCard
        self.repository = repository
        self.loader = loader
        self.names = names
    }
    
    func fetchNames() {
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
