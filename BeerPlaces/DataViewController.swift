//
//  DataViewController.swift
//  BeerPlaces
//
//  Created by Mac NNN on 06.12.16.
//  Copyright © 2016 NevDeveloper. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
    @IBOutlet weak var textDataViewController: UITextView!
    
    var dataObject: String = ""
//    var dataObject1: String = ""
    var index: Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/*    Это надо потом подправить */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textDataViewController.text = dataObject
//        textDataViewController.textColor = UIColor (white : 1.0, alpha : 1.0)
        textDataViewController.textColor = UIColor (red : 1.0, green : 1.0, blue : 1.0, alpha : 1.0)
        textDataViewController.textAlignment = .center
/*        self.dataLabel1!.text = dataObject1
        if (index != 0) {
            textView!.isHidden = true
            button!.isHidden = true
        }
        if (index == 0) {
            textView!.isScrollEnabled = true
        }
*/        
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
