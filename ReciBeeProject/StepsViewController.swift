//
//  StepsViewController.swift
//  ReciBeeProject
//
//  Created by Chee Kok Ban on 7/11/16.
//  Copyright © 2016 Chee Kok Ban. All rights reserved.
//

import UIKit

class StepsViewController: UIViewController {
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var miscTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backAction(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
