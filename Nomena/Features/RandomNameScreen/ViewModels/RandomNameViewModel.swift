import Observation

@MainActor
@Observable final class RandomNameViewModel {
    var currentCard: NamedCard?
    var errorMessage: String?
    
    private let repository: RandomNameRepository
    
    @ObservationIgnored
    private var names: [String]
    
    init(
        currentCard: NamedCard,
        repository: RandomNameRepository,
        names: [String]
    ) {
        self.currentCard = currentCard
        self.repository = repository
        self.names = names
    }
    
    func fetchNames() {
        do {
            let nameList = try repository.fetchNames()
            names = nameList.male + nameList.female
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
