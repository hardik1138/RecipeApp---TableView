
import UIKit

class ViewScreenCV: UIViewController {
    
    public var dish = ""
    public var safe = ""
    public var rate = ""
    private let backBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "back"), for: .normal)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        btn.backgroundColor = .clear
        return btn
    }()
    
    @objc func btnClick(){
        navigationController?.popViewController(animated: true)
    }
    public let dishImg: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 129
        iv.layer.borderWidth = 2.0
        iv.layer.borderColor = UIColor(hex: 0xFFFFFF).cgColor
        return iv
    }()
   
    private let scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .white
        sv.isScrollEnabled = true
        sv.contentSize = CGSize(width: 375, height: 1000)
        sv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return sv
    }()
    
    private let DesView:UIView = {
        let dv = UIView()
        dv.backgroundColor = .white
        dv.layer.cornerRadius = 50.0
        dv.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return dv
    }()
    
    private let easyImg: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "easy")
        return iv
    }()
    
    private let easyTxt:UILabel = {
        let label = UILabel()
        label.text="Easy"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let timeImg: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "timeLunch")
        return iv
    }()
    
    private let timeTxt:UILabel = {
        let label = UILabel()
        label.text="10 Min"
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let rateImg: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "rate1")
        return iv
    }()
    
    private let rateTxt:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let DishTxt:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let SafeTxt:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let InTitle:UILabel = {
        let label = UILabel()
        label.text="Ingredients"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let InContent:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.text = ""
        label.numberOfLines = 15
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let StepTitle:UILabel = {
        let label = UILabel()
        label.text="Steps"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    private let StepContent:UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.text = ""
        label.numberOfLines = 50
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    public func setVal()
    {
        dishImg.image = UIImage(named: dish)
        DishTxt.text = dish
        rateTxt.text = rate
        SafeTxt.text = safe
        
    }
    override func viewDidLoad() {
        view.backgroundColor = UIColor(hex:0xFD7463)
        super.viewDidLoad()
        view.addSubview(backBtn)
        view.addSubview(dishImg)
        view.addSubview(DesView)
        
        DesView.addSubview(scrollView)
        DesView.addSubview(easyImg)
        DesView.addSubview(timeImg)
        DesView.addSubview(rateImg)
        DesView.addSubview(easyTxt)
        DesView.addSubview(timeTxt)
        DesView.addSubview(rateTxt)
        DesView.addSubview(DishTxt)
        DesView.addSubview(SafeTxt)
        scrollView.addSubview(InTitle)
        scrollView.addSubview(InContent)
        scrollView.addSubview(StepTitle)
        scrollView.addSubview(StepContent)
        
        setVal()
        
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeup))
        upSwipe.direction = .up
        DesView.addGestureRecognizer(upSwipe)
        
        let DownSwipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeup))
        DownSwipe.direction = .down
        DesView.addGestureRecognizer(DownSwipe)
        
        let arrayOfLines = ["10 ounces chopped romaine lettuce* (about 2 medium or 3 small heads, chopped)","½ medium head of radicchio*, finely chopped (about 2 cups)","½ medium red onion, chopped (about 1 cup)","2 ribs celery, chopped","1 pint cherry tomatoes, thinly sliced","⅓ cup stemmed and thinly sliced pickled pepperoncini peppers","⅓ cup oil-packed sun-dried tomatoes, rinsed and roughly chopped" , "1 can (15 ounces) chickpeas, rinsed and drained, or 1 ½ cups cooked chickpeas" , "1 cup (4 ounces) ¼″ cubes of provolone cheese (optional)"]
        
        let StepArray = ["Step 1: To make the burger patty, pressure cook the carrot, peas and sweet corn for 1 whistle or until soft.","Step 2: Add the cooked vegetables, chopped onions, red chilli powder, lemon juice, garam masala powder, salt and ginger-garlic paste to a large bowl." , "Step 3: Add lemon juice and mashed potatoes in the bowl, mix well until evenly combined. Shape the mixture into small/medium patties." , "Step 4: Now heat oil in a pan over medium flame. Roll the prepared patties in the breadcrumbs and shallow fry until golden brown on both sides.", "Step 5: Remove and keep aside.", "Step 6: Take one half of the burger bun. Spread some butter and place the lettuce on top.", "Step 7: Place the prepared vegetable patty on top. Top up with slices of onion, tomato, cucumber and cheese. If you want to make it even more delicious and healthy replace cheese with eggless mayonnaise." , "Step 8: Cover it with the other half of the burger bun. If desired, add some ketchup on top. Secure it with a toothpick if desired.", "Step 9: Serve at once with french fries. Make sure you like this recipe, rate it and let us know in the comments how it turned out to be."]
         for value in arrayOfLines {
             InContent.text = InContent.text!  + " • " + value + "\n"
          }
        for value in StepArray {
            StepContent.text = StepContent.text!  + value + "\n"
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backBtn.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 20, width: 20, height: 20)
        dishImg.frame = CGRect(x: 59, y: view.safeAreaInsets.top + 29 , width: 258, height: 258)
        DesView.frame = CGRect(x: 0, y: dishImg.bottom + 10, width: view.width, height: view.height)
        scrollView.frame = CGRect(x: 0, y: DishTxt.bottom + 160, width: DesView.width, height: DesView.height)
        easyImg.frame = CGRect(x: 40, y: 30, width: 25, height: 25)
        timeImg.frame = CGRect(x: 175, y: 30, width: 25, height: 25)
        rateImg.frame = CGRect(x: view.right - 65, y: 30, width: 22, height: 22)
        easyTxt.frame = CGRect(x: 35, y: easyImg.bottom + 5, width: 50, height: 25)
        timeTxt.frame = CGRect(x: 160, y: easyImg.bottom + 5, width: 50, height: 25)
        rateTxt.frame = CGRect(x: view.right - 67, y: easyImg.bottom + 5, width: 50, height: 25)
        DishTxt.frame = CGRect(x: 0, y: timeTxt.bottom + 15, width: view.width, height: 30)
        SafeTxt.frame = CGRect(x: 0, y: DishTxt.bottom, width: view.width, height: 20)
        InTitle.frame = CGRect(x: 20, y: 10, width: view.width, height: 30)
        InContent.frame = CGRect(x: 20, y: InTitle.bottom, width: view.width - 40, height: 260)
        StepTitle.frame = CGRect(x: 20, y: InContent.bottom + 10, width: view.width, height: 30)
        StepContent.frame = CGRect(x: 20, y: StepTitle.bottom, width: view.width - 40, height: 450)

    }
    @objc func didSwipeup(gesture:UISwipeGestureRecognizer)
    {
        if gesture.direction == .up{
            UIView.animate(withDuration:0.5)
            {
                self.DesView.frame = CGRect(x: 0, y: self.view.top, width: self.view.width, height: self.view.height)
                self.DesView.layer.cornerRadius = 0
            }
        }else if gesture.direction == .down{
            UIView.animate(withDuration: 0.6)
            {
                self.DesView.frame = CGRect(x: 0, y: self.dishImg.bottom + 10, width: self.view.width, height: self.view.height)
                self.DesView.layer.cornerRadius = 50.0
            }
                
        }
    }
}
extension UIColor {

    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )

        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }

}
