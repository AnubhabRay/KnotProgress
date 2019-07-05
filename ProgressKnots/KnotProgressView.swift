//
//  KnotProgressView.swift
//  ProgressKnots
//
//  Created by Anubhab Ray on 04/07/19.
//  Copyright © 2019 Anubhab Ray. All rights reserved.
//

import UIKit

class KnotProgressView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var knotCount = 5
    var htKnots = 40
    var htProgress = 5
    var padding = 10
    
    // colors
    var colorKnotsActive = UIColor.red
    var colorKnotsInactive = UIColor.lightGray
    
    var colorLabelActive = UIColor.white
    var colorLabelInactive = UIColor.darkText
    
    var isBorder = false
    var fontSize : CGFloat = 15.0
    
    
    var state = 0
    
    var widthView : Int?
    
    var viewProgressHolder : UIView?
    var viewProgress : UIView?
    
    var arrViewKnots = [UIView]()
    
    //this init fires usually called, when storyboards UI objects created:
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //This method is called during programmatic initialisation
    override init(frame: CGRect) {
        super.init(frame: frame)
        widthView = Int(frame.width)
        
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func prepareView(){
        
        let colorBorder = isBorder ? UIColor.darkGray : UIColor.clear
        
        
        let viewHolder = UIView(frame: CGRect(x: 0  , y: 0, width: widthView ?? Int(UIScreen.main.bounds.size.width) , height: htKnots + (2 * padding)))
        viewHolder.backgroundColor = .white
        
        
        let distBtnKnots =  (widthView!  - (knotCount * htKnots) ) / (knotCount - 1)
        
        viewProgressHolder =  UIView(frame: CGRect(x: 0, y: (htKnots + 2 * padding) / 2, width: (widthView ?? Int(UIScreen.main.bounds.size.width - 40)) - htKnots/2, height: 2))
        viewProgressHolder!.backgroundColor = colorKnotsInactive
        
        viewProgress = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: (viewProgressHolder?.bounds.height)!))
        viewProgress!.backgroundColor = .red
        viewProgress!.tag = 169
        viewProgressHolder?.addSubview(viewProgress!)
        
        viewHolder.addSubview(viewProgressHolder!)
        
        
        for i in 0..<knotCount {
            let roundView = UIView(frame: CGRect(x: Int(i * (htKnots + distBtnKnots)), y: padding, width: htKnots, height: htKnots))
            roundView.backgroundColor = colorKnotsInactive
            roundView.layer.cornerRadius = CGFloat(htKnots / 2)
            
            roundView.layer.borderColor = colorBorder.cgColor
            roundView.layer.borderWidth = 1.0
            
            // set label
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: htKnots, height: htKnots))
            label.textAlignment = .center
            label.textColor = colorLabelInactive
            label.text = "\(i)"
            label.font = UIFont(name: "Helvetica-medium", size: fontSize)
            label.tag = 213
            roundView.addSubview(label)
            
            arrViewKnots.append(roundView)
            
            viewHolder.addSubview(roundView)
        }
        
        self.addSubview(viewHolder)
    }
    
    func changeKnotState(toState : Int){
        
        let viewKnot = arrViewKnots[toState]
        
        UIView.animate(withDuration: 0.6, animations: {
            self.viewProgress?.frame = CGRect(x: 0, y: 0, width: viewKnot.frame.origin.x, height: (self.viewProgress?.frame.height)!)
        }) { (success) in
            for views in viewKnot.subviews{
                if views.tag == 213{
                    let label = views as! UILabel
                    label.textColor = self.colorLabelActive
                }
            }
            viewKnot.backgroundColor = self.colorKnotsActive
        }
    }

}
