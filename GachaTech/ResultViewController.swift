//
//  ResultViewController.swift
//  GachaTech
//
//  Created by takafumi oosugi on 2016/02/09.
//  Copyright © 2016年 myname. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //一番後ろの背景のUIImageView
    @IBOutlet var haikeiImageView:UIImageView!
    
    //モンスターの画像を表示するためのUIImageView
    @IBOutlet var monsterImageView:UIImageView!
    
    //モンスター画像保存のための配列
    var monsterArray: [UIImage]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //0~9でランダムに数字を出す
        let number=Int(rand() % 9)
        
        //monsterArray配列に画像10枚追加
        monsterArray=[UIImage(named:"monster001.png")!,
        UIImage(named:"monster002.png")!,
        UIImage(named:"monster003.png")!,
        UIImage(named:"monster004.png")!,
        UIImage(named:"monster005.png")!,
        UIImage(named:"monster006.png")!,
        UIImage(named:"monster007.png")!,
        UIImage(named:"monster008.png")!,
        UIImage(named:"monster009.png")!,
        UIImage(named:"monster010.png")!
]
        
        //monsterArray配列の中からランダム(number)で表示
        monsterImageView.image=monsterArray[number]
        
        //numberの数字に応じて背景を変える
        if number==9{
            haikeiImageView.image=UIImage(named:"bg_gold.png")
        }else if number>6{
            haikeiImageView.image=UIImage(named:"bg_red.png")
        }else{
            haikeiImageView.image=UIImage(named:"bg_blue.png")
        }
    }
        //ResultViewControllerが表示されるたびに呼び出し
        override func viewDidAppear(animated:Bool){
            super.viewDidAppear(true)
            
            //アニメの中でもtransform(変形)させるキーパス
            let animation=CABasicAnimation(keyPath:"transform")
            
            //アニメーション開始時の数値
            animation.fromValue=NSNumber(double:0)
            
            //アニメーション終了時の数値(M_PIは角度の180度)
            animation.toValue=NSNumber(double:2*M_PI)

            //z軸を中心としたアニメーション
            animation.valueFunction=CAValueFunction(name:kCAValueFunctionRotateZ)
            
            //アニメーションの速さ
            animation.duration=5
            
            //アニメーションの繰り返し回数
            animation.repeatCount=Float.infinity
            
            //どのレイヤーにアニメーションをつけるか判定
            haikeiImageView.layer.addAnimation(animation,forKey:nil)
            
        }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        //前の画面に戻る関数
        @IBAction func modoru(){
            self.dismissViewControllerAnimated(true,completion:nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
