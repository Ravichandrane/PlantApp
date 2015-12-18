//
//  UserPlants.swift
//  PO Fleur
//
//  Created by Ravichandrane Rajendran on 17/12/15.
//  Copyright © 2015 Ravichandrane Rajendran. All rights reserved.
//

import Parse


struct UserPlants {
    let id: String!
    let plantName: String!
    let plant:PFRelation!
}


struct UserPlantsDictionnary {
    
    var list: [UserPlants] = []
    
    init(objects: [PFObject]?){
        
        if let objects = objects {
            for object in objects {
                
                let id = object.objectId
                let plantName = object.objectForKey("plantName") as! String
                let plant = object.objectForKey("plant") as! PFRelation
                
                list.append(UserPlants(id: id, plantName: plantName, plant:plant))
                
            }
        }
        
    }
    
}



