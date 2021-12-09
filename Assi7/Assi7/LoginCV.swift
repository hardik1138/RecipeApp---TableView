
import UIKit
class LoginCV: UIViewController {

    public let myLabel:UILabel = {
        let label =  UILabel()
        label.text = "Login"
        label.font = UIFont(name:"Times New Roman", size: 44)
        label.bold()
        return label
    }()
    
    private let myTxtUser:UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "Username"
        textField.textAlignment = .left
        textField.backgroundColor = .white
        return textField
    }()
    private let lineViewUser:UIView = {
        let lv = UIView()
        lv.backgroundColor = UIColor(rgb: 0xB0B0B0)
        return lv
    }()
    
    private let myTxtPwd:UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.isSecureTextEntry = true
        textField.placeholder = "********"
        textField.textAlignment = .left
        textField.backgroundColor = .white
        return textField
    }()
    private let lineViewPwd:UIView = {
        let lv = UIView()
        lv.backgroundColor = UIColor(rgb: 0xB0B0B0)
        return lv
    }()
    
    public let myForgot:UILabel = {
        let label =  UILabel()
        label.text = "Forgot password?"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let myBtnLogin:UIButton = {
        let btn = UIButton()
        btn.setTitle("Let’s cook!", for: .normal)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        btn.backgroundColor = UIColor(rgb: 0xFD7463)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 22
        btn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return btn
    }()
    
    private let myBtnface:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "fb"), for: .normal)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        btn.backgroundColor = UIColor(rgb: 0x4267B2)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 22
        btn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return btn
    }()
    
    @objc func btnClick(){
        if(myTxtUser.text == "Admin" && myTxtPwd.text == "admin")
        {
            let vc = BrowseCV()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    override func viewDidLoad() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "LoginScreen")!)
        super.viewDidLoad()
        view.addSubview(myLabel)
        view.addSubview(myTxtUser)
        view.addSubview(lineViewUser)
        view.addSubview(myTxtPwd)
        view.addSubview(lineViewPwd)
        view.addSubview(myForgot)
        view.addSubview(myBtnLogin)
        view.addSubview(myBtnface)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myLabel.frame = CGRect(x: 40, y: 180, width: view.width, height: 60)
        myTxtUser.frame = CGRect(x: 40, y: myLabel.bottom + 10 , width: view.width - 80, height: 50)
        lineViewUser.frame = CGRect(x: 40, y: myTxtUser.bottom - 5, width: myTxtUser.width - 50, height: 1)
        myTxtPwd.frame = CGRect(x: 40, y: lineViewUser.bottom + 10 , width: (view.width / 2), height: 50)
        lineViewPwd.frame = CGRect(x: 40, y: myTxtPwd.bottom - 5, width: myTxtUser.width/2, height: 1)
        myForgot.frame = CGRect(x: 40, y: lineViewPwd.bottom - 10 , width: view.width, height: 50)
        myBtnLogin.frame = CGRect(x: view.width / 2 + 20, y: myForgot.bottom + 20, width: view.width/2 - 20 , height: 45)
        myBtnface.frame = CGRect(x: view.width / 2 + 120, y: myBtnLogin.bottom + 20, width: view.width/2 - 120 , height: 45)
    }
    
}
