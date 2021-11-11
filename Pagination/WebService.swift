import Foundation

class WebService {
    static let shared = WebService()
    
    private init() {}
    
    func fetch(pageNumber: Int, pageSize: Int) -> [Item] {
        let total = total()
        if total == 0 || pageNumber > ((total - 1) / pageSize + 1) {
            return []
        }
        
        let first = (pageNumber - 1) * pageSize + 1
        let last = min(total, pageNumber * pageSize)
        return (first...last).map(Item.init)
    }
    
    func total() -> Int {
        return 100
    }
}

struct Item {
    let id: Int
    var name: String {
        "Item \(id)"
    }
}
