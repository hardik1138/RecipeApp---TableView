import UIKit

class BrowseCV: UIViewController {
    
    private let mainTitle:UILabel = {
        let label =  UILabel()
        label.text = "What do you want to cook today?"
        label.numberOfLines = 2
        label.font = UIFont(name:"Times New Roman", size: 30)
        label.bold()
        //label.font = .boldSystemFont(ofSize : 30)
        return label
    }()
    private let mySearchBar:UITextField = {
        let textFiled = UITextField()
        textFiled.textColor = UIColor(rgb: 0xA6A6A6)
        textFiled.placeholder = "Search..."
        textFiled.textAlignment = .left
        textFiled.backgroundColor = UIColor(rgb: 0xF4F4F4)
        textFiled.layer.cornerRadius = 22
        textFiled.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0)
        return textFiled
    }()
    private let subTitle:UILabel = {
        let label =  UILabel()
        label.text = "Popular lunch recipes"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let myTableView = UITableView()
    private var dish = ["Veg salad", "Burger", "Orange cake", "Indian soup", "Veg frankie roll"]
    private var safe = ["Disha Prajapati","Hinal Lukhi","Ruchi Ankola","Bhumi Vaghasiya","Juhi Prajapati"]
    private var rate = ["5.0", "4.5" ,"4.3" , "4.1", "4.2"]
    private var postTime = ["15 min ago", "4 Days ago" , "10 min ago" , "1 Day ago","50 min ago" ]
    
    
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        super.viewDidLoad()
        view.addSubview(mainTitle)
        view.addSubview(mySearchBar)
        view.addSubview(subTitle)
        view.addSubview(myTableView)
        myTableView.showsHorizontalScrollIndicator = false
        myTableView.showsVerticalScrollIndicator = false
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mainTitle.frame = CGRect(x: 25, y: view.safeAreaInsets.top + 45, width: view.width - 50, height: 80)
        mySearchBar.frame = CGRect(x: 25, y: mainTitle.bottom + 10 , width: view.width - 50, height: 40)
        subTitle.frame = CGRect(x: 25, y: mySearchBar.bottom  , width: view.width, height: 40)
        myTableView.frame = CGRect(x: 20, y: subTitle.bottom, width: view.width - 40, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - subTitle.bottom)
    }
    
}
extension BrowseCV : UITableViewDelegate,UITableViewDataSource{
    private func setupTableView() {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(TableViewCell.self, forCellReuseIdentifier: "CityCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dish.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! TableViewCell
        cell.setupCityCellWith(title: dish[indexPath.row],s: safe[indexPath.row] ,r: rate[indexPath.row],pt:postTime[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 210
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dish[indexPath.row])
        let vc = ViewScreenCV()
        vc.dish = dish[indexPath.row]
        vc.safe =  safe[indexPath.row]
        vc.rate = rate[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
