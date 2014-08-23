//
//  AFNetworkingClient.swift
//  ImpLight
//
//  Created by de la Rosa, Luis on 8/22/14.
//  
//

import UIKit

class AFNetworkingClient: NSObject {

    // variables
    var httpRequestOperationManager: AFHTTPRequestOperationManager
    
    // initializer
    override init()  {
        httpRequestOperationManager = AFHTTPRequestOperationManager()
        // Electric Imp agent returns text/plain
        httpRequestOperationManager.responseSerializer = AFTextResponseSerializer()
        // TODO add a plain/text serializer
//        httpRequestOperationManager.responseSerializer.acceptableContentTypes = NSSet(object: "text/plain")
    }

    // Issue an HTTP GET to the Electric Imp agent
    func sendHttpRequestToElectricImp(#color: String) {
        // translate to RGB hex value
//        "https://agent.electricimp.com/qnEfEUX85B7J?led=0&rgb=%23aa7942&timer=10&user=",
        let url = "https://agent.electricimp.com/qnEfEUX85B7J?led=0&rgb=%23\(color)&timer=10&user="
        println("url:\(url)")
        httpRequestOperationManager.GET(
            url,
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                println("Success: " + responseObject.description)
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                println("Error: " + error.localizedDescription)
        })
    }


}
