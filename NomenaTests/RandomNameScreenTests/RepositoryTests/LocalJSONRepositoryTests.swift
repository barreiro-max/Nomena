import Testing
@testable import Nomena

@Suite
struct LocalJSONRepositoryTests {
    private let sut = LocalJSONRepository()
    private let filename = "names.json"
    
    @Test
    func repository_fetch_expectedDoesNotThrow() {
        #expect(throws: Never.self) {
            try sut.fetch(from: filename)
        }
    }
    
    @Test
    func repository_fetch_returnsNonEmptyMaleAndFemaleLists() throws {
        let names = try #require(
            try sut.fetch(from: filename)
        )
        #expect(!names.male.isEmpty)
        #expect(!names.female.isEmpty)
    }
}
