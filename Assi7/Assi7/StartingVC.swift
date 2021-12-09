
import UIKit
class StartingVC: UIViewController {

    private let myButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Get Started", for: .normal)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        btn.backgroundColor = .white
        btn.setTitleColor(UIColor(rgb: 0xFD7463), for: .normal)
        btn.layer.cornerRadius = 22
        return btn
    }()
    @objc func btnClick(){
        let vc = LoginCV()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "StartingScreen")!)
        view.addSubview(myButton)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myButton.frame = CGRect(x: 60, y: view.bottom - 80, width: view.width - 120, height: 45)
    }
}
