import Observation

@MainActor
@Observable final class RandomNameViewModel {
    var currentCard: NamedCard?
    var errorMessage: String?
    
    private let repository: JSONRepository
    
    @ObservationIgnored
    private var names: [String]
    
    init(
        currentCard: NamedCard,
        repository: JSONRepository,
        names: [String]
    ) {
        self.currentCard = currentCard
        self.repository = repository
        self.names = names
    }
    
    func fetchNames() {
        do {
            let nameList = try repository.fetch(from: "names.json")
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
