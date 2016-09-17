//
//  ComparisonViewController.swift
//  BeerBuyingCompanion
//
//  Created by Pedro Rodrigues on 9/15/16.
//  Copyright © 2016 Pedro Howat. All rights reserved.
//

import UIKit

struct Beer {
    let name: String
    let price: Float
    let portion: Float
    var pricePerPortion: Float {
        get {
            return (price / portion) * 1000
        }
    }
}

class ComparisonViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let ctds = ComparisonTableDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = ctds
        tableView.dataSource = ctds

        let addButton = UIBarButtonItem(title: "+", style: .done, target: self, action: #selector(addButtonClicked))
        self.navigationItem.rightBarButtonItems = [addButton]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        print("DELETEME: VDA")
        print(ctds.dataStore.count)
        tableView.reloadData()
    }

    func addButtonClicked() {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(
            withIdentifier: "AddBeerViewController") as! AddBeerViewController

        vc.ctds = ctds
        navigationController?.pushViewController(vc, animated: true)
    }
}

class ComparisonTableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    var dataStore: [Beer] = []

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beer = dataStore[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath)
        cell.textLabel?.text = "\(beer.name) -> R$ \(beer.pricePerPortion)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
