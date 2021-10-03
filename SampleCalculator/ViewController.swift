//
//  ViewController.swift
//  SampleCalculator
//
//  Created by Muneharu Onoue on 2021/10/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plsBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var multiBtn: UIButton!
    @IBOutlet weak var divBtn: UIButton!
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 初期はプラスボタンが選択される
        plsBtn.isSelected = true
    }

    @IBAction func tappedButton(_ tappedButton: UIButton) {
        // すべてのボタンを未選択に戻す
        plsBtn.isSelected = false
        minusBtn.isSelected = false
        multiBtn.isSelected = false
        divBtn.isSelected = false
        
        // 選択ボタンをtrueにする
        tappedButton.isSelected = true
    }

    // 計算ボタン押下時の処理
    @IBAction func tappedCalcButton(_ sender: UIButton) {
        let num1 = Int(input1.text ?? "0") ?? 0
        let num2 = Int(input2.text ?? "0") ?? 0
        
        if plsBtn.isSelected {
            // 足し算して、ラベルに表示
            label1.text = "\(num1 + num2)"
        } else if minusBtn.isSelected {
            // 引き算して、ラベルに表示
            label1.text = "\(num1 - num2)"
        } else if multiBtn.isSelected {
            // 掛け算して、ラベルに表示
            label1.text = "\(num1 * num2)"
        } else if divBtn.isSelected {
            // 割り算して、ラベルに表示
            label1.text = "\(num1 / num2)"
        }
        
    }
    
    // キーボード閉じるための処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

