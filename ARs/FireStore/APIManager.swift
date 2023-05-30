////
////  APIManager.swift
////  ARs
////
////  Created by Nuradinov Adil on 07/05/23.
////
//
//import Foundation
//import UIKit
//import Firebase
//import FirebaseStorage
//import FirebaseDatabase
//
//class APIManager {
//    static let shared = APIManager()
//
//    private func configureFB() -> Firestore {
//        var db: Firestore!
//        let settings = FirestoreSettings()
//        Firestore.firestore().settings = settings
//        db = Firestore.firestore()
//        return db
//    }
//
//    func getPost(collection: String, docName: String, completion: @escaping (Document?) -> Void) {
//        let db = configureFB()
//        db.collection(collection).document(docName).getDocument { document, error in
//            guard error == nil else { completion(nil); return}
//            let doc = Document(name: document?.get("name") as! String, description: document?.get("description") as! String, images: document?.get("images") as! [String], address: document?.get("address") as! String)
//            print(doc)
//            completion(doc)
//        }
//    }
//
//    func getImages(picNames: [String], completion: @escaping (UIImage) -> Void) {
//        let storage = Storage.storage()
//        let reference = storage.reference()
//        let pathRef = reference.child("pictures")
//
//        var image: UIImage = UIImage(named: "music festival")!
//        for img in 1...5 {
//            let fileRef = pathRef.child(picNames[img] + ".jpg")
//            fileRef.getData(maxSize: 1024*1024) { data, error in
//                guard error == nil else { completion(image); return }
//                image = UIImage(data: data!)!
//                completion(image)
//            }
//        }
//    }
//}
//
////struct APIManager {
////    static let shared = APIManager()
////    let dbRef = Database.database().reference()
////
////    func fetchAllItems() {
////        dbRef.child("Trento").observe(.childAdded) { (snapshot) in
////            print(snapshot)
////        }
////    }
////}
