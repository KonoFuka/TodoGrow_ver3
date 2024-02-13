//
//  TodoItem.swift
//  TodoGrow
//
//  Created by 香野風花 on 2024/01/16.
//

import Foundation
import RealmSwift

class TodoItem: Object {
    @Persisted var id: Int!
    
    @Persisted var title: String = ""
    @Persisted var day: String = ""
    @Persisted var alarm: String = ""
    @Persisted var isMarked: Bool = false
    @Persisted var Repeat: String = ""
    @Persisted var content: String = ""
    
    @Persisted var isdone: Bool = false
}

class TodoCount: Object {
    @Persisted var todocount: Int = 0
}

class WaterCount: Object {
    @Persisted var water: Int = 0
}

