import Testing
@testable import Nomena

@Suite
struct LocalJSONRepositoryTests {
    private let sut = LocalJSONRepository()
    private let filename = "names.json"
    
    @Test
    func repository_fetch_expectedDoesNotThrow() async {
        await #expect(throws: Never.self) {
            try await sut.fetch(from: filename)
        }
    }
    
    @Test
    func repository_fetch_returnsNonEmptyMaleAndFemaleLists() async throws {
        let names = try #require(
            try await sut.fetch(from: filename)
        )
        #expect(!names.male.isEmpty)
        #expect(!names.female.isEmpty)
    }
}
