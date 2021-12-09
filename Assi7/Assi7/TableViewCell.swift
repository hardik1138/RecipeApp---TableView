import UIKit
class TableViewCell: UITableViewCell {
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.opacity = 0.6
        return imageView
    }()
    
    private let SView:UIView = {
        let sv = UIView()
        sv.backgroundColor = .black
        sv.layer.cornerRadius = 10
        return sv
    }()
    
    private let safeName:UILabel = {
        let label =  UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.bold()
        return label
    }()
    
    private let rateTxt:UILabel = {
        let label =  UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.bold()
        return label
    }()
    
    private let rateView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage (named: "rate")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let dishName:UILabel = {
        let label =  UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 26)
        label.textColor = .white
        label.bold()
        return label
    }()
    
    private let timeView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage (named: "time")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let timeTxt:UILabel = {
        let label =  UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    private let likeView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage (named: "like")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let like:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage (named: "heart")
        imageView.layer.opacity = 0.8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    @objc func didTapview(gesture:UITapGestureRecognizer)
    {
        likeView.image = UIImage(named: "likered-2")
        UIView.animate(withDuration: 0.2,animations: {
            self.like.frame =  CGRect(x: 150, y: 74, width: 40, height: 40)
            self.like.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
            self.like.alpha = 1.0
        },completion: {(_ finished: Bool) -> Void in
            self.like.alpha = 0.0
            self.like.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.like.frame =  CGRect(x: 150, y: 74, width: 0, height: 0)
        })
    }
    
    func setupCityCellWith(title dish: String,s safe:String,r rate:String,pt postTime:String){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapview))
        tapGesture.numberOfTapsRequired = 2
        tapGesture.numberOfTouchesRequired = 1
        contentView.addGestureRecognizer(tapGesture)
        
        contentView.backgroundColor = .white
        contentView.addSubview(SView)
        SView.addSubview(myImageView)
        SView.addSubview(safeName)
        SView.addSubview(rateView)
        SView.addSubview(rateTxt)
        SView.addSubview(dishName)
        SView.addSubview(timeView)
        SView.addSubview(timeTxt)
        SView.addSubview(likeView)
        SView.addSubview(like)
        
        like.frame =  CGRect(x: 150, y: 74, width: 0, height: 0)
        
        SView.frame = CGRect(x: 0, y: 10, width: contentView.width, height: contentView.height - 10)
        myImageView.frame = CGRect(x: 0, y: 0, width: SView.width, height: SView.height)
        safeName.frame = CGRect(x: 17, y: 13, width: 200, height: 19)
        rateView.frame = CGRect(x: 269, y: 14, width: 17, height: 16)
        rateTxt.frame = CGRect(x: rateView.left + 25 , y: 14, width: 100, height: 19)
        dishName.frame =  CGRect(x: 17, y: 125, width: 200, height: 30)
        timeView.frame = CGRect(x: 17, y: dishName.bottom + 10, width: 17, height: 17)
        timeTxt.frame  = CGRect(x: timeView.left + 25 , y: dishName.bottom + 9 , width: 100, height: 19)
        likeView.frame = CGRect(x: 291, y: dishName.bottom + 10, width: 25, height: 25)
        
        myImageView.image = UIImage (named: dish)
        safeName.text = safe
        rateTxt.text = rate
        dishName.text = dish
        timeTxt.text = postTime
    }
}
