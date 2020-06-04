//
//  ViewController.swift
//  SwiftSearch
//
//  Created by Jimmy Huynh on 6/2/20.
//  Copyright © 2020 Jimmy Huynh. All rights reserved.
//

import UIKit
import NCMB

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func SearchIn(_ sender: Any) {
        var query : NCMBQuery<NCMBObject> = NCMBQuery.getQuery(className: "SearchClass")
        query.where(field: "name", containedIn: ["name5","name2"])
        query.findInBackground(callback: { result in
            switch result {
                case let .success(array):
                    print("result: \(array)")
                case let .failure(error):
                    print("error: \(error)")
            }
        })
    }
    
    @IBAction func SearchInArray(_ sender: Any) {
        var query : NCMBQuery<NCMBObject> = NCMBQuery.getQuery(className: "SearchClass")
        query.where(field: "name", containedInArrayTo: ["name5","name2"])
        query.findInBackground(callback: { result in
            switch result {
                case let .success(array):
                    print("result: \(array)")
                case let .failure(error):
                    print("error: \(error)")
            }
        })
    }
}

