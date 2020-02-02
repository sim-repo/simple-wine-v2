import UIKit


class SelectedFilter {
    
    var categoryId = 0
    var filters: [InnerFilter] = []
    
    init(categoryId: Int) {
        self.categoryId = categoryId
    }

    func append(id: Int, title: String, parentId: Int, kind: Int) {
        let filter = InnerFilter(id: id, parentId: parentId, title: title, kind: kind)
        filters.append(filter)
    }
    
    
    func remove(by filter: Filter) {
        filters.removeAll(where: {$0.id == filter.id})
    }
    
    func remove(by indexPath: IndexPath) {
        filters.remove(at: indexPath.row)
    }
    
    
    struct InnerFilter {
        var id = 0
        var parentId = 0
        var title = ""
        var kind = 0
    }
}
