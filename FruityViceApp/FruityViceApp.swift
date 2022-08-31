import SwiftUI

@main
struct FruityViceApp: App {
    var body: some Scene {
        WindowGroup {
            FruitListView(viewModel: FruitListViewModel())
        }
    }
}
