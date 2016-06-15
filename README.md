### 评分控件，Xcode 8 beta,Swift3

#####示例
```swift
      Class ViewController:UIViewController{
        var score:LQScore?
        ...
        override func viewDidLoad(){
          super.viewDidLoad()
          ...
          self.score = LQScore(frame: CGRect(x: 100, y: 10, width: 100, height: 22))
          self.score?.isSelect = true
          self.score?.highlightImg = UIImage(named: "btn_star_evaluation_press")
          self.score?.normalImg = UIImage(named: "btn_star_evaluation_normal")
          self.score?.max_star = 5
          self.score?.show_star = 4
          self.view.addSubview(score!)
        }
        ...
      }
```
