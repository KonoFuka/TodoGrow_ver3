//
//  TodoItem.swift
//  TodoGrow
//
//  Created by 香野風花 on 2024/01/16.
//

import Foundation
import RealmSwift

class TodoItem: Object {
    @Persisted var title: String = ""
    @Persisted var day: String = ""
    @Persisted var alarm: String = ""
    @Persisted var isMarked: Bool = false
    @Persisted var content: String = ""
    
}

