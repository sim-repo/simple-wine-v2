import UIKit


class DropDownView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var dropDownOptions = [String]()
    var tableView = UITableView()
    var delegate : DropDownProtocol!
    var presenter: SortablePresenter!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        for value in SortEnum.allCases {
            dropDownOptions.append(value.rawValue)
        }
        
        tableView.backgroundColor = .darkGray
        self.backgroundColor = .darkGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: super.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: super.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: super.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPresenter(sortablePresenter: SortablePresenter) {
         presenter = sortablePresenter
     }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = #colorLiteral(red: 0.9032102823, green: 0.8978413939, blue: 0.907337606, alpha: 1)
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.textLabel?.font = cell.textLabel?.font.withSize(12)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let sortEnum = SortEnum.init(rawValue: dropDownOptions[indexPath.row]) {
            presenter.didSortSelect(sortEnum: sortEnum)
            delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
        }
    }
}

