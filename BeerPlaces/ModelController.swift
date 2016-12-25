//
//  ModelController.swift
//  BeerPlaces
//
//  Created by Mac NNN on 06.12.16.
//  Copyright © 2016 NevDeveloper. All rights reserved.
//

import UIKit

class ModelController: NSObject, UIPageViewControllerDataSource {
    
    
    let pageData: [String] =
        [NSLocalizedString("WELCOME_SCREEN_1", value: "Welcome to Beer Places app!\n\nYou’ve made right choice! \nHere you can find a lot about your favorite beers and places where possible to spend time with friends and down a shot of beer and take your mind of troubles for a while.", comment: "Used to welcome users"),
         NSLocalizedString("WELCOME_SCREEN_2", value: "If you like some pub or beer restaurant, you can add it to our data base, share the information with friends and Beer places’ users.", comment: "Used to explain apps"),
         NSLocalizedString("WELCOME_SCREEN_3", value: "Terms and Conditions. \n\nDear friend! Using Beer Places app assumes observance some rules and conditions. It’s important to read and understand them. When you read and agree with the Terms and Conditions, please, push the button «Accept». Pushing the button means you agree all conditions are applied to you, when you granted access to Beer Places, also you confirm you are of legal drinking age in your country.", comment: "Used for terms and conditions")]
    
        
    override init() {
        super.init()
        // Create the data model.
//        let dateFormatter = DateFormatter()
//        pageData = dateFormatter.weekdaySymbols
    }
    
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> DataViewController? {
        // Return the data view controller for the given index.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let dataViewController = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        dataViewController.dataObject = self.pageData[index]
//        dataViewController.dataObject1 = self.pageData1[index]
        dataViewController.index = index
        
        return dataViewController
    }
    
    func indexOfViewController(_ viewController: DataViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return pageData.index(of: viewController.dataObject) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController as! DataViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.pageData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int { // The number of items reflected in the page indicator.
        
        return 3
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int { // The selected item reflected in the page indicator.
        return 0
    }
        

}
