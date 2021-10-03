## 電卓アプリ

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/SampleCalculator/blob/master/gifs%2Bimgs/demo.png" width="50%" height="50%"/></div>

  当アカウントへ訪れていただき、誠にありがとうございます。第26回アプリ教室では、計算アプリを作ります。自分のペースで勉強したい、勉強前に予習したい、内容を復習したい場合、ご利用ください。

## 開発環境
  Xcode 12.4 / Swift 5

## アプリ作成手順

## 0, プロジェクト作成

> 0-1. Xcodeを起動。
>
> 0-2. "Create a new Xcode project"を選択。
>
> 0-3. "Single View Application"を選択して"Next"をクリック。
>
> 0-4. "User Interface"を"Storyboard"選択
>
> 0-5. "Product name"を適当に入力して"Next"をクリック。
>
> 0-6. プロジェクトの場所を指定して"Create"をクリック。

## 1, アプリをデザインする。

#### 🗂 Main.storyboard

1-1. UITextField（入力欄） を 2つ storyboad に追加

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/SampleCalculator/blob/master/gifs%2Bimgs/1.gif" /></div></details>

1-2. UIButton（計算ボタン, +ボタン, -ボタン） を 1つ storyboad に追加

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/SampleCalculator/blob/master/gifs%2Bimgs/2.png" /></div></details>

1-3. UILabel（計算結果表示） を 2つ storyboad に追加

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/SampleCalculator/blob/master/gifs%2Bimgs/3.png" /></div></details>

1-4. UITextField（入力欄） を 数値入力に変更

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/SampleCalculator/blob/master/gifs%2Bimgs/4.png" /></div></details>

## 2, 下記のコードを"ViewController.swift"に追加

#### 🗂 ViewController.swift

```Swift
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
```

## 3, UI部品 を "ViewController.swift" に紐付ける

#### 🗂 Main.storyboard -> ViewController.swift

3-1. 2画面に分割

★ optionを押しながらViewController.swiftをダブルクリック

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/SampleCalculator/blob/master/gifs%2Bimgs/5.gif" /></div></details>

3-2. UITextField（入力欄） を 2つ "ViewController.swift" に紐付ける（connection を Outlet にする）

★ controlを押しながらドラッグ

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/SampleCalculator/blob/master/gifs%2Bimgs/6.gif" /></div></details>

3-3. UILabel（計算結果表示） を "ViewController.swift" に紐付ける（connection を Outlet にする）

★ controlを押しながらドラッグ

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/SampleCalculator/blob/master/gifs%2Bimgs/7.gif" /></div></details>

3-4. UIButton（計算ボタン） を "ViewController.swift" に紐付ける（connection を Action にする）

★ controlを押しながらドラッグ

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/SampleCalculator/blob/master/gifs%2Bimgs/8.gif" /></div></details>


## 4, 追加課題

#### 引き算や掛け算機能を追加
