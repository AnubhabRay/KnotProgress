//
//  ViewController.swift
//  ProgressKnots
//
//  Created by Anubhab Ray on 04/07/19.
//  Copyright © 2019 Anubhab Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    // generic datas
    let knotCount = 5
//    let htKnots = 40
//    let htProgress = 5
//    let padding = 10
//
//    // colors
//    let colorKnotsActive = UIColor.red
//    let colorKnotsInactive = UIColor.lightGray
//
//    let colorLabelActive = UIColor.white
//    let colorLabelInactive = UIColor.darkText
//
//    let isBorder = false
//
//    var state = 0
//
//    var widthView : Int?
//
//    var viewProgressHolder : UIView?
//    var viewProgress : UIView?
//
//    var arrViewKnots = [UIView]()
    
    var counter = 0
    var timer : Timer?
    
    var viewKnot : KnotProgressView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        setup()
        callToChangeState()
    }
    
    func setup(){
        viewKnot = KnotProgressView(frame: CGRect(x: 20, y: 250, width: 250, height: 50))
//        viewKnot?.knotCount = 4
//        viewKnot?.htKnots = 30
//        viewKnot?.isBorder = true
        viewKnot?.prepareView()
        
        self.view.addSubview(viewKnot!)
    }
    
    func callToChangeState(){
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(callForState), userInfo: nil, repeats: true)
        timer!.fire()
    }
    @objc func callForState(){
        if counter < viewKnot!.knotCount{
            self.viewKnot!.changeKnotState(toState: counter)
            counter = counter + 1
        }
        else{
            timer!.invalidate()
        }
    }
//    func prepareView(){
//
//        let colorBorder = isBorder ? UIColor.darkGray : UIColor.clear
//
//
//        let viewHolder = UIView(frame: CGRect(x: 20, y: 250, width: widthView ?? Int(UIScreen.main.bounds.size.width - 40), height: htKnots + (2 * padding)))
//        viewHolder.backgroundColor = .white
//
//
//        let distBtnKnots =  (widthView ?? Int(UIScreen.main.bounds.size.width - 40) - knotCount * htKnots ) / (knotCount - 1)
//
//        viewProgressHolder =  UIView(frame: CGRect(x: 0, y: (htKnots + 2 * padding) / 2, width: widthView ?? Int(UIScreen.main.bounds.size.width - 40) - htKnots/2, height: 2))
//        viewProgressHolder!.backgroundColor = colorKnotsInactive
//
//        viewProgress = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: (viewProgressHolder?.bounds.height)!))
//        viewProgress!.backgroundColor = .red
//        viewProgress!.tag = 169
//        viewProgressHolder?.addSubview(viewProgress!)
//
//        viewHolder.addSubview(viewProgressHolder!)
//
//
//        for i in 0...knotCount {
//            let roundView = UIView(frame: CGRect(x: Int(i * (htKnots + distBtnKnots)), y: padding, width: htKnots, height: htKnots))
//            roundView.backgroundColor = colorKnotsInactive
//            roundView.layer.cornerRadius = CGFloat(htKnots / 2)
//
//            roundView.layer.borderColor = colorBorder.cgColor
//            roundView.layer.borderWidth = 1.0
//
//            // set label
//            let label = UILabel(frame: CGRect(x: 0, y: 0, width: htKnots, height: htKnots))
//            label.textAlignment = .center
//            label.textColor = colorLabelInactive
//            label.text = "\(i)"
//            label.font = UIFont(name: "Helvetica-medium", size: 15.0)
//            label.tag = 213
//            roundView.addSubview(label)
//
//            arrViewKnots.append(roundView)
//
//
//
//            viewHolder.addSubview(roundView)
//        }
//
//
//
//        self.view.addSubview(viewHolder)
//    }
//
//    func changeKnotState(toState : Int){
//
//        let viewKnot = arrViewKnots[toState]
//
//        UIView.animate(withDuration: 0.6, animations: {
//            self.viewProgress?.frame = CGRect(x: 0, y: 0, width: viewKnot.frame.origin.x, height: (self.viewProgress?.frame.height)!)
//        }) { (success) in
//            for views in viewKnot.subviews{
//                if views.tag == 213{
//                    let label = views as! UILabel
//                    label.textColor = self.colorLabelActive
//                }
//            }
//            viewKnot.backgroundColor = self.colorKnotsActive
//        }
//
//    }

}

