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
        [NSLocalizedString("WELCOME_SCREEN_1", value: "Welcome to the Beer Places app.\n\nYou’ve made the right choice! \nHere you can find out about your favourite beers and where you can enjoy them. So come on! Invite your friends and take your mind of your troubles for a while…", comment: "Used to welcome users"),
         NSLocalizedString("WELCOME_SCREEN_2", value: "If you like the Bar or Pub add it to your favourites and share your thoughts with your friends and colleagues about your experience….You can even share your thoughts with other Beer Place users!", comment: "Used to explain apps"),
         NSLocalizedString("WELCOME_SCREEN_3", value: "Terms and Conditions. \n\nDear friend!\nBefore using the Beer Places app it is important to read and understand the Terms and Conditions that apply to its use. When you have done this, please push the \"Accept\" button. \nCompleting this action means that you agree to all the conditions applied to you as the user.\nWhen you are granted access to Beer Places you must also confirm that you are of legal drinking age in your country.", comment: "Used for terms and conditions")]
    
    
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
