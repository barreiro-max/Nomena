import Testing
@testable import Nomena

@MainActor
struct RandomNameViewModelTests {
    private let viewModel: RandomNameViewModel
    
    init() {
        let mock = MockLocalJSONRepository()
        let loader = NamesLoader(repository: mock)
        viewModel = RandomNameViewModel(
            currentCard: .init(name: "TestCard"),
            loader: loader,
            names: []
        )
    }
    
    @Test func viewModel_loadNames_expectedSixNames_fromMockRepo() async {
        await viewModel.loadNames()
        #expect(viewModel.names.count == 6)
    }
    
    @Test func viewModel_loadNames_expectedErrorMessage_equalNil() async {
        await viewModel.loadNames()
        #expect(viewModel.errorMessage == nil)
    }
    
    @Test func viewModel_loadNames_expectedIsLoading_equalFalse() async {
        await viewModel.loadNames()
        #expect(!viewModel.isLoading)
    }
    
    @Test func viewModel_changeCard_currentCardDoesntHaveName_whenNamesNotLoaded() throws {
        viewModel.changeCard()
        
        let card = try #require(viewModel.currentCard)
        #expect(card.name == "Імʼя відсутнє")

    }

    @Test func viewModel_changeCard_setsCurrentCard_nonNil() async {
        await viewModel.loadNames()
        
        viewModel.changeCard()
        
        #expect(viewModel.currentCard != nil)
    }
}
