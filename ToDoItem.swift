//
//  ToDoItem.swift
//  ToDo
//
//  Created by Scholar on 6/11/24.
//

import Foundation
import SwiftData

@Model
class ToDoItem {
    var title : String
    var isImportant : Bool
    
    init(title: String, isImportant: Bool) {
        self.title = title
        self.isImportant = isImportant
    }

}
