import Combine
import FruityVice
import Foundation

class FruitListViewModel: ObservableObject {
    
    @Published var fruits = [Fruit]()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        guard let publisher = FruityVice.shared.getFruitsPublisher() else { return }
        
        publisher
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("finished")
                }
            } receiveValue: { [weak self] fruits in
                guard let self = self else { return }
                
                self.fruits = fruits
            }.store(in: &cancellables)
    }
    
}

extension Fruit: Identifiable {}
