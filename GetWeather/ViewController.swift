//
//  ViewController.swift
//  GetWeather
//
//  Created by Александр Прендота on 09.04.16.
//  Copyright © 2016 Александр Прендота. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    let url = "http://api.openweathermap.org/data/2.5/forecast/city?id=524901&APPID=a7a551a913b3979fe01b3e56c05d2a5f"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stringURL = NSURL(string: url)
        let session = NSURLSession.sharedSession()
        let _  = session.downloadTaskWithURL(stringURL!, completionHandler:
            {(location : NSURL?, response: NSURLResponse?, error: NSError?) -> Void in
                
                let weatherData = NSData(contentsOfURL: stringURL!)
                do {
                    let weatherJSON = try! NSJSONSerialization.JSONObjectWithData(weatherData!, options:[] ) as! NSDictionary
            
                    //print(weatherJSON)
                    let city = openMapWeather(weatherJSON: weatherJSON)
                    
                    print(city.name)
                    print(city.description)
 
                } catch {
                    print("Fetch failed: \((error as NSError).localizedDescription)")
                }
            
                
                
                

        }).resume()
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
