//
//  Middleware.swift
//  volkszaehler
//
//  Created by Andreas Götz on 08/10/2016.
//  Copyright © 2016 Andreas Götz. All rights reserved.
//

import Foundation
import SwiftyJSON

class Middleware {
    
    var name: String
    var uri: String
    
    var channels = [Channel]()
    
    init(name: String, uri:String) {
        self.name = name
        self.uri = uri
    }
    
    func loadChannels() {
//        let channel = Channel(uuid: "0815-4711")
//        channels += [channel]
        
//        let url = URL(string: uri + "/capabilities/definitions.json")!
        let url = URL(string: uri + "/entity.json")!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            guard let data = data, let _:URLResponse = response , error == nil else {
                print("error")
                return
            }
        
            let dataString =  String(data: data, encoding: String.Encoding.utf8)
            print(dataString)
            
            let json = JSON(data: data)
            let uuids =  json["entities"].arrayValue.map({$0["uuid"].stringValue})
            print(uuids)
            
            for var uuid in uuids {
                let title = self.getChannelAttribute(json: json, uuid: uuid, attribute: "title")!
                let channel = Channel(uuid: uuid, title: title)
                self.channels += [channel]
            }
        }
        
        task.resume()
    }
    
    func getChannelAttribute(json: JSON, uuid: String, attribute: String) -> String? {
        for (_,entity):(String, JSON) in json["entities"] {
            if entity["uuid"].stringValue == uuid {
                return entity[attribute].stringValue
            }
        }
        return nil
    }
    
//    func addChannel(_ channel: Channel) {
//        channels += [channel]
//    }
}
