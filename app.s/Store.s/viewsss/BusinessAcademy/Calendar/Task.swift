//
//  Task.swift
//  Store.s
//
//  Created by Sedra Asrawi on 04/09/2022.
//


import SwiftUI

// Task Model and Sample Tasks...
// Array of Tasks...
struct Task: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

// Total Task Meta View...
struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

// sample Date for Testing...
func getSampleDate(offset: Int)->Date{
    let calender = Calendar.current
    
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

// Sample Tasks...
var tasks: [TaskMetaData] = [

    TaskMetaData(task: [
    
        Task(title: "Lesson at 5PM"),
        
    ], taskDate: getSampleDate(offset: 1)),
    TaskMetaData(task: [
        
        Task(title: "Lesson at 6PM")
    ], taskDate: getSampleDate(offset: -3)),
    TaskMetaData(task: [
        
        Task(title: "Lesson at 7PM")
    ], taskDate: getSampleDate(offset: -8)),
    TaskMetaData(task: [
        
        Task(title: "Lesson at 5PM")
    ], taskDate: getSampleDate(offset: 10)),
    TaskMetaData(task: [
        
        Task(title: "Lesson at 8PM")
    ], taskDate: getSampleDate(offset: -22)),
    TaskMetaData(task: [
        
        Task(title: "Lesson at 3PM")
    ], taskDate: getSampleDate(offset: 15)),
    TaskMetaData(task: [
        
        Task(title: "Lesson at 11AM")
    ], taskDate: getSampleDate(offset: -20)),
]


