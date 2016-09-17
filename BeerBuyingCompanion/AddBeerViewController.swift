//
//  AddBeerViewController.swift
//  BeerBuyingCompanion
//
//  Created by Pedro Rodrigues on 9/17/16.
//  Copyright © 2016 Pedro Howat. All rights reserved.
//

import UIKit

class AddBeerViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var portionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var pricePerPortionTextField: UILabel!

    var ctds: ComparisonTableDataSource!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButtonClicked(_ sender: UIButton) {

        if let name = nameTextField.text, let portionString = portionTextField.text, let priceString = priceTextField.text, let portion = Float(portionString), let price = Float(priceString), name.characters.count > 0 {


            let beer = Beer(name: name, price: price, portion: portion)
            ctds.dataStore.append(beer)
            _ = navigationController?.popViewController(animated: true)
        }


    }

    @IBAction func someItemChanged() {
        if let portionString = portionTextField.text, let priceString = priceTextField.text, let portion = Float(portionString), let price = Float(priceString) {

            pricePerPortionTextField.text = String(price / portion * 1000)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
