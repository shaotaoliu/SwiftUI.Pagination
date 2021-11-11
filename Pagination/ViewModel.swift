import Foundation

class ViewModel: ObservableObject {
    @Published var items: [Item] = []
    @Published var currentPage = 1
    private var pageSize: Int
    
    init(pageSize: Int) {
        self.pageSize = pageSize
        fetch()
    }
    
    var title: String {
        let total = totalPages()
        return "\(total == 0 ? 0 : currentPage) / \(total)"
    }
    
    private func fetch() {
        items = WebService.shared.fetch(pageNumber: currentPage, pageSize: pageSize)
    }
    
    func previousPage() {
        if currentPage > 1 {
            currentPage -= 1
            fetch()
        }
    }
    
    func nextPage() {
        if !isLastPage() {
            currentPage += 1
            fetch()
        }
    }
    
    func firstPage() {
        currentPage = 1
        fetch()
    }
    
    func lastPage() {
        currentPage = totalPages()
        fetch()
    }
    
    func isFirstPage() -> Bool {
        return currentPage == 1
    }
    
    func isLastPage() -> Bool {
        let total = WebService.shared.total()
        return currentPage == ((total - 1) / pageSize + 1)
    }
    
    func totalPages() -> Int {
        let total = WebService.shared.total()
        if total == 0 {
            return 0
        }
        
        return (total - 1) / pageSize + 1
    }
}
