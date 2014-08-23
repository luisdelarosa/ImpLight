//
//  AFNetworkingClient.swift
//  ImpLight
//
//  Created by de la Rosa, Luis on 8/22/14.
//  
//

import UIKit

class AFNetworkingClient: NSObject {
    
    // Set this to your agent ID
    let agentId = "qnEfEUX85B7J"
    
    // This is how long to let the LED be lit up
    let ledTimeout = 10

    // variables
    var httpRequestOperationManager: AFHTTPRequestOperationManager
    
    // initializer
    override init()  {
        httpRequestOperationManager = AFHTTPRequestOperationManager()
        // Electric Imp agent returns text/plain
        httpRequestOperationManager.responseSerializer = AFTextResponseSerializer()
    }

    // Issue an HTTP GET to the Electric Imp agent
    func sendHttpRequestToElectricImp(#color: String) {
        // translate to RGB hex value
        let url = "https://agent.electricimp.com/\(agentId)?led=0&rgb=%23\(color)&timer=\(ledTimeout)&user="
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
