//
//  ViewController.swift
//  TagListViewDemo
//
//  Created by Dongyuan Liu on 2015-05-09.
//  Copyright (c) 2015 Ela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TagListViewDelegate {

    @IBOutlet weak var tagListView: TagListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tagListView.delegate = self
        tagListView.addTag("TagListView")
        tagListView.addTag("TEAChart")
        tagListView.addTag("To Be Removed")
        tagListView.addTag("To Be Removed")
        tagListView.addTag("Quark Shell")
        tagListView.removeTag("To Be Removed")
        tagListView.addTag("On tap will be removed").onTap = { [weak self] tagView in
            self?.tagListView.removeTagView(tagView)
        }
        
        let tagView = tagListView.addTag("gray")
        tagView.tagBackgroundColor = UIColor.grayColor()
        tagView.onTap = { tagView in
            print("Don’t tap me!")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: TagListViewDelegate
    func tagPressed(title: String, tagView: TagView, sender: TagListView) {
        print("Tag pressed: \(title), \(sender)")
        tagView.selected = !tagView.selected
    }
    
    func tagRemoveButtonPressed(title: String, tagView: TagView, sender: TagListView) {
        
        sender.removeTagView(tagView)
    }
    
    func tagAddButtonPressed(title: String, tagView: TagView, sender: TagListView) {
        
        sender.removeTagView(tagView)
    }
}

