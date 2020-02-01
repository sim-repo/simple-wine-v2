import Foundation


class SelectedFilter {
    var id = 0
    var parentId = 0
    var title = ""
    var kind = 0
    
    init(id: Int, title: String, parentId: Int, kind: Int) {
        self.id = id
        self.title = title
        self.parentId = parentId
        self.kind = kind
    }

}
