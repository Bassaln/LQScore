//
//  LQScore.swift
//  LQBook
//
//  Created by dklq on 16/3/1.
//  Copyright © 2016年 dklq. All rights reserved.
//

import UIKit

@IBDesignable
class LQScore: UIView,UIGestureRecognizerDelegate {

    private var touchWidth:CGFloat = 0.0
    private var starWidth:CGFloat = 0.0
    private var toppading:CGFloat = 0.0
    
    var show_star:Int = 0{
        didSet{
            self.setNeedsDisplay()
        }
    }
    var show_score:CGFloat = 0
    var space:CGFloat = 0{
        didSet{
            starWidth = (self.frame.size.width - CGFloat(20) - CGFloat(max_star-1)*space)/CGFloat(max_star);
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var padding:CGFloat = 0
    var max_star:Int = 0{
        didSet{
            starWidth = (self.frame.size.width - CGFloat(20) - CGFloat(max_star-1)*space)/CGFloat(max_star);
            self.setNeedsDisplay()
        }
    }
    var isSelect:Bool = false
    var normalImg:UIImage?{
        didSet{
            self.setNeedsDisplay()
        }
    }
    var highlightImg:UIImage?{
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    override func awakeFromNib() {
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        if max_star < 1{
            max_star = 5
        }
        self.backgroundColor = UIColor.clear()
        
        if space < 1{
            space = 2
        }
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(LQScore.handleSingleTap(_:)))
        self.addGestureRecognizer(singleTap)
        singleTap.delegate = self
        singleTap.cancelsTouchesInView = false
    }
    
    func handleSingleTap(_ sender:UITapGestureRecognizer){
        if isSelect{
            let pt = sender.location(in: self)
            if pt.x > padding{
                show_star = Int((pt.x - padding)/(starWidth + space)) + 1
                self.setNeedsDisplay()
            }
        }
    }
    
    override func layoutSubviews(){
    
        self.starWidth = (self.frame.size.width - 20 - CGFloat(max_star-1)*space)/CGFloat(max_star);
        starWidth = (starWidth > self.bounds.height) ? self.bounds.height : starWidth
        toppading = (self.bounds.size.height - starWidth)/2;
    }
    
    override func draw(_ rect:CGRect){
    // Drawing code
        for i in 0..<max_star {
            if (i<show_star) {
                highlightImg!.draw(in: CGRect(x:padding+(starWidth+space)*CGFloat(i), y:toppading,width: starWidth,height: starWidth))
            }else{
                normalImg!.draw(in: CGRect(x:padding+(starWidth+space)*CGFloat(i), y:toppading,width: starWidth,height: starWidth))
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isSelect{
            let pt = touches.first!.location(in: self)
            if pt.x > padding{
                show_star = Int((pt.x - padding)/(starWidth + space))+1
                self.setNeedsDisplay()
            }
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isSelect{
            let pt = touches.first!.location(in: self)
            if pt.x > padding{
                show_star = Int((pt.x - padding)/(starWidth + space))+1
                self.setNeedsDisplay()
            }
        }
    }

}
