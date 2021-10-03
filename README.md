## 電卓アプリ

  <div style="text-align:center"><img src ="https://github.com/tailup0/SampleCalculator/blob/master/gifs%2Bimgs/demo1.png" width="50%" height="50%"/></div>

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

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/tailup0/SampleCalculator/blob/master/gifs%2Bimgs/1.gif" /></div></details>

1-2. UIButton（計算ボタン, +ボタン, -ボタン） を 3つ storyboad に追加

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/tailup0/SampleCalculator/blob/master/gifs%2Bimgs/2.png" /></div></details>

1-3. UILabel（計算結果表示） を 2つ storyboad に追加

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/tailup0/SampleCalculator/blob/master/gifs%2Bimgs/3.png" /></div></details>

1-4. UITextField（入力欄） を 数値入力に変更

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/tailup0/SampleCalculator/blob/master/gifs%2Bimgs/4.png" /></div></details>

## 2, 下記のコードを"ViewController.swift"に追加

#### 🗂 ViewController.swift

```Swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plsBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var input1: UITextField!
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var label1: UILabel!

    // 画面起動時に実行される
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // 初期はプラスボタンが選択される
        plsBtn.isSelected = true
    }

    // +, - ボタン押下時の処理
    @IBAction func tappedButton(_ tappedButton: UIButton) {
        // すべてのボタンを未選択に戻す
        plsBtn.isSelected = false
        minusBtn.isSelected = false

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

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/tailup0/SampleCalculator/blob/master/gifs%2Bimgs/5.gif" /></div></details>

3-2. 各部品を "ViewController.swift" に紐付ける

★ controlを押しながらドラッグ

```
■紐付け先
1) + ボタン => plsBtn, tappedButton
2) - ボタン => minusBtn, tappedButton
3) 計算 ボタン => tappedCalcButton
4) 入力欄1 => input1
5) 入力欄2 => input2
6) 答え表示ラベル => label1
```

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/tailup0/SampleCalculator/blob/master/gifs%2Bimgs/6.gif" /></div></details>

## 4, 追加課題1 掛け算と割り算を追加

  <div style="text-align:center"><img src ="https://github.com/tailup0/SampleCalculator/blob/master/gifs%2Bimgs/demo2.png" width="50%" height="50%"/></div>

#### 🗂 Main.storyboard

4-1. UIButton（×ボタン, ÷ボタン） を 2つ storyboad に追加

#### 🗂 ViewController.swift

```Swift
    // ヒント
    @IBOutlet weak var multiBtn: UIButton!
    @IBOutlet weak var divBtn: UIButton!

    @IBAction func tappedButton(_ tappedButton: UIButton) {
        // すべてのボタンを未選択に戻す
        plsBtn.isSelected = false
        minusBtn.isSelected = false
        multiBtn.isSelected = false
        divBtn.isSelected = false

        // 選択ボタンをtrueにする
        tappedButton.isSelected = true
    }

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
```

#### 🗂 Main.storyboard -> ViewController.swift

4-2. 2画面に分割

★ optionを押しながらViewController.swiftをダブルクリック

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/tailup0/SampleCalculator/blob/master/gifs%2Bimgs/5.gif" /></div></details>

4-3. 各部品を "ViewController.swift" に紐付ける

★ controlを押しながらドラッグ

```
■紐付け先
1) × ボタン => multiBtn, tappedButton
2) ÷ ボタン => divBtn, tappedButton
```

## 5, 追加課題2 0で割り算時にlabel1に「エラー」と表示する

  <div style="text-align:center"><img src ="https://github.com/tailup0/SampleCalculator/blob/master/gifs%2Bimgs/demo3.png" width="50%" height="50%"/></div>

#### 🗂 ViewController.swift

```Swift
    // ヒント
    if num2 == 0 {
        label1.text = "エラー"
    } else {
        label1.text = "\(num1 / num2)"
    }
```

## 6, 追加課題3 入力欄クリアボタンを追加

#### 🗂 ViewController.swift

```Swift
    // ヒント
    input1.text = ""
    input2.text = ""
```

