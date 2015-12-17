//
//  Plants.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 17/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import Parse

struct Plants {
    let cold: Int!
    let preserve: Int!
    let sunlight: Int!
    let variety: String!
    let water: Int!
}

struct PlantsDictionnary {
    
    var list: [Plants] = []
    
    init(objects: [PFObject]?){
        
        if let objects = objects {
            for object in objects {
                let cold = object.objectForKey("cold") as! Int
                let preserve = object.objectForKey("preserve") as! Int
                let sunlight = object.objectForKey("sunlight") as! Int
                let variety = object.objectForKey("variety") as! String
                let water = object.objectForKey("water") as! Int
                
                list.append(Plants(cold: cold, preserve: preserve, sunlight: sunlight, variety: variety, water: water))
                
            }
        }
    
    }

}