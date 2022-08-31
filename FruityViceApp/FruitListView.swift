import SwiftUI

struct FruitListView: View {
    
    @StateObject var viewModel: FruitListViewModel
    
    var body: some View {
        List($viewModel.fruits) { fruit in
            Text(fruit.name.wrappedValue)
                .fontWeight(.bold)
        }.overlay(Group {
            if viewModel.fruits.count == 0 {
                ProgressView()
            }
        })
    }
    
}

struct FruitListView_Previews: PreviewProvider {
    static var previews: some View {
        FruitListView(viewModel: FruitListViewModel())
    }
}
