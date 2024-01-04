//
//  AppDelegate.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //MARK:- Using realm for data persistance
    /*
     App Delegate:
        Adding the realm to the project.
     
     
     Category Class:
        it is a realm object. By subclassing this object class we are able to save our data using realm
        What properties they should have
        dyanmic keyword to monitor the change of the variable during project
        List is the reation ship
     
     
     Item Class:
        Linkable objects is the inverse relationship (connectiong via type and property name)
     
        
     
     
    
     
     
     
     */



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        do{
            let _ = try Realm()
        }catch {
            print("error installing new real, \(error)")
            
        }
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {

           self.saveContext()
       }

    // MARK: - Core Data stack
        
        lazy var persistentContainer: NSPersistentContainer = {

            let container = NSPersistentContainer(name: "DataModel")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {

                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
        
        // MARK: - Core Data Saving support
        
        func saveContext () {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {

                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }

}

