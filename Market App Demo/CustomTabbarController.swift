//
//  CustomTabbarController.swift
//  Market App Demo
//
//  Created by Vijay લાDવા on 01/11/18.
//  Copyright © 2018 Vijay લાDવા. All rights reserved.
//

import UIKit
import ESTabBarController_swift
import pop

class CustomTabbarController: NSObject {

    static let shared = CustomTabbarController()
    
    func getTabbar() -> UINavigationController {
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let tabBarController = ESTabBarController()
        tabBarController.title = "Irregularity"
        //        tabBarController.tabBar.shadowImage = UIImage(named: "transparent")
        //        tabBarController.tabBar.backgroundImage = UIImage(named: "background_dark")
        tabBarController.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        //        tabBarController.didHijackHandler = {
        //            [weak tabBarController] tabbarController, viewController, index in
        //
        //            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        //                let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        //                let takePhotoAction = UIAlertAction(title: "Take a photo", style: .default, handler: nil)
        //                alertController.addAction(takePhotoAction)
        //                let selectFromAlbumAction = UIAlertAction(title: "Select from album", style: .default, handler: nil)
        //                alertController.addAction(selectFromAlbumAction)
        //                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        //                alertController.addAction(cancelAction)
        //                tabBarController?.present(alertController, animated: true, completion: nil)
        //            }
        //        }
        
        let v1 = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController")
        let v2 = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController")
        let v3 = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController")
        let v4 = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController")
        let v5 = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController")
        
        v1.tabBarItem = ESTabBarItem.init(MarketIrregularityBasicContentView(), title: "Account", image: UIImage(named: "ic_IconWallet"), selectedImage: UIImage(named: "ic_IconWallet"))
        v2.tabBarItem = ESTabBarItem.init(MarketIrregularityBasicContentView(), title: "Card", image: UIImage(named: "ic_Card"), selectedImage: UIImage(named: "ic_Card"))
        v3.tabBarItem = ESTabBarItem.init(MarketIrregularityContentView(), title: nil, image: UIImage(named: "ic_qr"), selectedImage: UIImage(named: "ic_qr"))
        v4.tabBarItem = ESTabBarItem.init(MarketIrregularityBasicContentView(), title: "Market", image: UIImage(named: "ic_Marketplace"), selectedImage: UIImage(named: "ic_Marketplace"))
        v5.tabBarItem = ESTabBarItem.init(MarketIrregularityBasicContentView(), title: "More", image: UIImage(named: "ic_More"), selectedImage: UIImage(named: "ic_More"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        let navigationController = UINavigationController(rootViewController: tabBarController)
        navigationController.setNavigationBarHidden(true, animated: false)
        return navigationController
    }
}



class MarketIrregularityBasicContentView: MarketBouncesContentView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textColor = UIColor.lightGray
        highlightTextColor = UIColor.black
        iconColor = UIColor.lightGray
        highlightIconColor = UIColor.black
        backdropColor = UIColor.clear
        highlightBackdropColor = UIColor.clear
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class MarketBouncesContentView: MarketBasicContentView {
    
    public var duration = 0.3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func selectAnimation(animated: Bool, completion: (() -> ())?) {
        self.bounceAnimation()
        completion?()
    }
    
    override func reselectAnimation(animated: Bool, completion: (() -> ())?) {
        self.bounceAnimation()
        completion?()
    }
    
    func bounceAnimation() {
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        impliesAnimation.duration = duration * 2
        impliesAnimation.calculationMode = CAAnimationCalculationMode.cubic
        imageView.layer.add(impliesAnimation, forKey: nil)
    }
}

class MarketBasicContentView: ESTabBarItemContentView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
        highlightTextColor = UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
        iconColor = UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
        highlightIconColor = UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


class MarketIrregularityContentView: ESTabBarItemContentView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageView.backgroundColor = UIColor.white
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.layer.cornerRadius = 35
        self.insets = UIEdgeInsets.init(top: -32, left: 0, bottom: 0, right: 0)
        let transform = CGAffineTransform.identity
        self.imageView.transform = transform
        self.superview?.bringSubviewToFront(self)
        
        textColor = UIColor.white
        highlightTextColor = UIColor.black
        iconColor = UIColor.black
        highlightIconColor = UIColor.black
        backdropColor = .clear
        highlightBackdropColor = .clear
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let p = CGPoint.init(x: point.x - imageView.frame.origin.x, y: point.y - imageView.frame.origin.y)
        return sqrt(pow(imageView.bounds.size.width / 2.0 - p.x, 2) + pow(imageView.bounds.size.height / 2.0 - p.y, 2)) < imageView.bounds.size.width / 2.0
    }
    
    override func updateLayout() {
        super.updateLayout()
        self.imageView.sizeToFit()
        self.imageView.center = CGPoint.init(x: self.bounds.size.width / 2.0, y: self.bounds.size.height / 2.0)
    }
    
    public override func selectAnimation(animated: Bool, completion: (() -> ())?) {
        let view = UIView.init(frame: CGRect.init(origin: CGPoint.zero, size: CGSize(width: 2.0, height: 2.0)))
        view.layer.cornerRadius = 1.0
        view.layer.opacity = 0.5
        view.backgroundColor = UIColor.white
        self.addSubview(view)
        playMaskAnimation(animateView: view, target: self.imageView, completion: {
            [weak view] in
            view?.removeFromSuperview()
            completion?()
        })
    }
    
    public override func reselectAnimation(animated: Bool, completion: (() -> ())?) {
        completion?()
    }
    
    public override func deselectAnimation(animated: Bool, completion: (() -> ())?) {
        completion?()
    }
    
    public override func highlightAnimation(animated: Bool, completion: (() -> ())?) {
        UIView.beginAnimations("small", context: nil)
        UIView.setAnimationDuration(0.2)
        let transform = self.imageView.transform.scaledBy(x: 0.8, y: 0.8)
        self.imageView.transform = transform
        UIView.commitAnimations()
        completion?()
    }
    
    public override func dehighlightAnimation(animated: Bool, completion: (() -> ())?) {
        UIView.beginAnimations("big", context: nil)
        UIView.setAnimationDuration(0.2)
        let transform = CGAffineTransform.identity
        self.imageView.transform = transform
        UIView.commitAnimations()
        completion?()
    }
    
    private func playMaskAnimation(animateView view: UIView, target: UIView, completion: (() -> ())?) {
        view.center = CGPoint.init(x: target.frame.origin.x + target.frame.size.width / 2.0, y: target.frame.origin.y + target.frame.size.height / 2.0)
        
        let scale = POPBasicAnimation.init(propertyNamed: kPOPLayerScaleXY)
        scale?.fromValue = NSValue.init(cgSize: CGSize.init(width: 1.0, height: 1.0))
        scale?.toValue = NSValue.init(cgSize: CGSize.init(width: 36.0, height: 36.0))
        scale?.beginTime = CACurrentMediaTime()
        scale?.duration = 0.3
        scale?.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeOut)
        scale?.removedOnCompletion = true
        
        let alpha = POPBasicAnimation.init(propertyNamed: kPOPLayerOpacity)
        alpha?.fromValue = 0.6
        alpha?.toValue = 0.6
        alpha?.beginTime = CACurrentMediaTime()
        alpha?.duration = 0.25
        alpha?.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeOut)
        alpha?.removedOnCompletion = true
        
        view.layer.pop_add(scale, forKey: "scale")
        view.layer.pop_add(alpha, forKey: "alpha")
        
        scale?.completionBlock = ({ animation, finished in
            completion?()
        })
    }
    
}
