//
//  CoreDataStack.swift
//  Skincare
//
//  Created by Carolina Ortega on 14/12/21.
//
//
import Foundation
import CoreData

class CoreDataStack {
    static let shared: CoreDataStack = CoreDataStack()
    
    private init() {}
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
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
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Core Data Getting support
    
    func getAllRoutines() -> [Routine] {
        let fr = NSFetchRequest<Routine>(entityName: "Routine")
        do {
            return try self.persistentContainer.viewContext.fetch(fr)
        } catch {
            print(error)
        }
        return []
    }
    
    // MARK: - Core Data Creating support
    
    func createRoutine(routineName: String, dataEnd: Date, dataStart: Date, seg: Bool, ter: Bool, qua: Bool, qui: Bool, sex: Bool, sab: Bool, dom: Bool) -> Routine {
        let routine = Routine(context: self.persistentContainer.viewContext)
        
        routine.routineName = routineName
        routine.dataEnd = dataEnd
        routine.dataStart = dataStart
        routine.seg = seg
        routine.ter = ter
        routine.qua = qua
        routine.qui = qui
        routine.sex = sex
        routine.sab = sab
        routine.dom = dom
        
        self.saveContext()
        return routine
    }
    
    // MARK: - Core Data deleting support
    
    func deleteObject(routine: Routine) {
        self.persistentContainer.viewContext.delete(routine)
        self.saveContext()
    }
}
