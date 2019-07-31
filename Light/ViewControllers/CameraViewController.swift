//
//  CameraViewController.swift
//  Light
//
//  Created by Kemar Galloway on 7/28/19.
//  Copyright © 2019 Kemar Galloway. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase

class CameraViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!
    @IBOutlet weak var btnShare: UIButton!
    var selectedImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        view.backgroundColor = .white
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CameraViewController.handleSelectedPhoto))
        photo.addGestureRecognizer(tapGesture)
        photo.isUserInteractionEnabled = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func handleSelectedPhoto() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    @IBAction func btnShare_TouchUpInside(_ sender: Any) {
        if let profileImg = self.selectedImage, let imageData = profileImg.jpegData(compressionQuality: 0.1) {
            let photoIdString = NSUUID().uuidString
            let storageRef = Storage.storage().reference(forURL: Config.STORAGE_ROOT_REF).child("post").child(photoIdString)
            storageRef.putData(imageData, metadata: nil) { (metadata, error) in
//                guard let metadata = metadata else {
                    // Uh-oh, an error occurred!
//                    return
//                }
                // Metadata contains file metadata such as size, content-type.
//                let size = metadata.size
                // You can also access to download URL after upload.
                storageRef.downloadURL { (url, error) in
                    guard let photoUrl = url?.absoluteString else {
                        // Uh-oh, an error occurred!
                        return
                    }
                    self.sendDataToDatabase(photoUrl: photoUrl)
                }
            }
        } else {
            print("some error occured")
        }
    }
    
    func sendDataToDatabase(photoUrl: String) {
        let ref = Database.database().reference()
        let postsReference = ref.child("posts")
        let newPostId = postsReference.childByAutoId().key
        let newPostReference = postsReference.child(newPostId!)
        newPostReference.setValue(["photoUrl": photoUrl], withCompletionBlock: {
            (error, ref) in
            if error != nil {
                print("error! ", error!.localizedDescription)
            }
            print("success")
        })
    }
}

extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("did finish picking media")
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImage = image
            photo.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
