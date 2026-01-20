import Foundation

struct NamedCard: Identifiable {
    let id: UUID
    let createdAt: Date
    let name: String
    var isFavourite: Bool
    
    init(
        id: UUID = .init(),
        createdAt: Date = .now,
        name: String,
        isFavourite: Bool = false
    ) {
        self.id = id
        self.createdAt = createdAt
        self.name = name
        self.isFavourite = isFavourite
    }
}
