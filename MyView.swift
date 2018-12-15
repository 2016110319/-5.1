//
//  MyView.swift
//  实验5.1
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 2016110319. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    private var function:((CGFloat)->CGFloat)?//一元函数

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
 
   override func draw(_ rect: CGRect) {
    //调用父类函数
    super.draw(rect)
    //创建UIBezierPath变量（UIBezierPath可创建基于矢量的路径）
    let rectPath = UIBezierPath(rect: rect)
    //设置白色填充
    UIColor.white.setFill()
     //先将MyView填充一层白色
    rectPath.fill()
    //再创建一个UIBezierPath变量，用于绘制坐标系
    let path = UIBezierPath()
    //坐标系用红色描边
    UIColor.red.setStroke()
    
    //坐标系以MyView中心为原点，向右为x正方向，向上为y正方向,先将path移动到左边线中点处
    path.move(to: CGPoint(x: 0, y: rect.height / 2))
    //添加一条到右边线中点处的直线
    path.addLine(to: CGPoint(x: rect.width, y: rect.height / 2))
    //绘制这条直线
    path.stroke()//x轴绘制完成
    //y轴绘制
    path.move(to: CGPoint(x: rect.width / 2, y: 0))
    path.addLine(to: CGPoint(x: rect.width / 2, y: rect.height))
    path.stroke()
    
    //判断函数是否为空，方便后面会再次调用draw函数
    if function != nil {
        let path = curve(rect: rect, color: UIColor.red, function: function!)
        path.stroke()
    }
  }
 
    //绘制图形的函数
    /// - Parameter function: 需要绘制的一元函数
    func drawCurve(function: @escaping (CGFloat) -> CGFloat) {
        self.function = function
        self.draw(self.frame)
    }

    /// 计算函数绘制的路径
    ///
    /// - Parameters:
    ///   - rect: 绘制区域
    ///   - color: 绘制函数的颜色
    ///   - function: 需要绘制的函数
    /// - Returns: 返回最终绘制的路径
    private func curve(rect: CGRect, color:UIColor, function: (CGFloat) -> CGFloat) -> UIBezierPath{
    let path = UIBezierPath()
         //该绘制区域的宽度的一半
        let center = rect.width / 2
        //y轴的高度的一半
        let height = rect.height / 2
        
        let rate:CGFloat = 100
        color.setStroke()
        
        //从原点开始，先计算x轴正半轴的所有y值
        path.move(to: CGPoint(x: center, y: height - function(0) / rate))
         //stride为步进函数，设置起始值、结尾值和步进值
        for item in stride(from: center / rate, through: center, by: center / rate){
            path.addLine(to: CGPoint(x: center + item, y: height - function(item) / rate))
        }
        
        //绘制x轴负半轴的所有y值
        path.move(to: CGPoint(x: center, y: height - function(0) / rate))
        for item in stride(from: center / rate, through: center, by: center / rate){
            path.addLine(to: CGPoint(x: center - item, y: height - function(-item) / rate))
        }
        return path
    }

}
