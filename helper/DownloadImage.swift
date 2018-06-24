//
//  DownloadImage.swift
//  vanhack
//
//  Created by Fernando Goulart on 22/06/2018.
//  Copyright © 2018 Leapi. All rights reserved.
//

import Foundation
import UIKit


class DownloadImage: NSObject {
    
    public func getFrom(url aUrl : URL,token: String,  myImage: @escaping (_ image : UIImage?) -> Void) {
        
        let session = URLSession(configuration: .default)
        
        //creating a dataTask
        
        var request = URLRequest(url: aUrl)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "x-access-token")
        request.timeoutInterval = 300000.00
        request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
        
        
        
        let getImageFromUrl = session.dataTask(with: request) { (data, response, error) in
            //let getImageFromUrl = session.dataTask(with: aUrl) { (data, response, error) in
            
            //if there is any error
            if let e = error {
                //displaying the message
                print("Error Occurred Do: \(e)")
                myImage(nil)
                
            } else {
                //in case of now error, checking wheather the response is nil or not
                if (response as? HTTPURLResponse) != nil {
                    
                    //checking if the response contains an image
                    if let imageData = data {
                        
                        //getting the image
                        let image = UIImage(data: imageData)
                        
                        myImage(image)
                    } else {
                        print("Image file is currupted")
                    }
                } else {
                    print("No response from server")
                }
            }
        }
        
        //starting the download task
        getImageFromUrl.resume()
        
    }
}

