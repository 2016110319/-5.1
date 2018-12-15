//
//  MyViewController.swift
//  实验5.1
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 2016110319. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    //声明UILabel对象
    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //设置根视图背景颜色
        self.view.backgroundColor = UIColor.white
        
        let myView = MyView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height - 20))
        myView.drawCurve { (x) -> CGFloat in
            return x * x
        }
        self.view.addSubview(myView)
        //创建UILabel对象
        label = UILabel(frame: CGRect(x: 250, y: 50, width: 100, height: 40))
        //设置label显示文字
        label.text = "hello world"
        //将label加入视图控制器
        self.view.addSubview(label)
        
        //创建UIButton对象
        let button = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
         //设置正常状态下按钮的标题
        button.setTitle("click me", for: .normal)
         //设置按钮边框宽度
        button.layer.borderWidth = 1
         //设置正常状态下标题的颜色
        button.setTitleColor(UIColor.black, for: .normal)
         //设置高亮状态下（被点击且未释放鼠标）标题的颜色
        button.setTitleColor(UIColor.brown, for: .highlighted)
         //给按钮添加target-action
        button.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        
        //将button加入视图控制器
        self.view.addSubview(button)
        
        //创建UIImageView对象
        let imageView = UIImageView(frame: CGRect(x: 10, y: 400, width: self.view.frame.width - 20, height: (self.view.frame.width - 20)*0.618))
        //获取图片资源路径
        let path = Bundle.main.path(forResource: "Cat", ofType: "jpg")
        //以该路径创建图片
        let image = UIImage(contentsOfFile: path!)
        //将图片加入到imageView中
        imageView.image = image
        //将imageView加入到控制器中
        self.view.addSubview(imageView)

    }
    
    // 按钮点击事件，改变label显示的文字
    @objc func clicked() {
        if label.text == "hello world" {
            label.text = "I'm clicked"
        } else {
            label.text = "hello world"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
