import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel(pageSize: 15)
    
    var body: some View {
        VStack {
            HStack {
                if !vm.isFirstPage() {
                    Button("First") {
                        vm.firstPage()
                    }
                }
                
                Spacer()
                Text(vm.title)
                Spacer()
                
                if !vm.isLastPage() {
                    Button("Last") {
                        vm.lastPage()
                    }
                }
            }
            .padding(.horizontal)
            
            List {
                ForEach(vm.items, id: \.id) { item in
                    Text(item.name)
                }
            }
            
            HStack {
                if !vm.isFirstPage() {
                    Button("Prev") {
                        vm.previousPage()
                    }
                }
                
                Spacer()
                Text(vm.title)
                Spacer()
                
                if !vm.isLastPage() {
                    Button("Next") {
                        vm.nextPage()
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
