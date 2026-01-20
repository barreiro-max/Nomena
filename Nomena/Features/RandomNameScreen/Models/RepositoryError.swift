import Foundation

enum RepositoryError: LocalizedError {
    case fileNotFound
    case dataReadFailed
    case decodingFailed(Error)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound: 
            "Файл не знайдено"
        case .dataReadFailed:
            "Помилка читання даних"
        case .decodingFailed(let error):
            "Помилка декодування: \(error.localizedDescription)"
        }
    }
}
