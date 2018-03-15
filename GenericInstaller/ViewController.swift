//
//  ViewController.swift
//  GenericInstaller
//
//  Created by 土肥一郎 on 2018/03/16.
//  Copyright © 2018年 土肥一郎. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var targetUrl: NSTextField!
    @IBAction func onSelectFile(_ sender: NSButton) {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canChooseFiles = true
        openPanel.canCreateDirectories = false
        openPanel.allowedFileTypes = ["app"]
        openPanel.begin(completionHandler: { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                guard let url = openPanel.url else { return }
                self.targetUrl.stringValue = url.path
            }
        })
    }
    
    @IBOutlet weak var outputUrl: NSTextField!
    @IBAction func onSelectOutputDirectoryDown(_ sender: NSButton) {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = true
        openPanel.canCreateDirectories = true
        openPanel.canChooseFiles = false
        openPanel.begin(completionHandler: { (result) -> Void in
            if result == NSApplication.ModalResponse.OK {
                guard let url = openPanel.url else {return}
                self.outputUrl.stringValue = url.path
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension NSView {
    
    @IBInspectable var backgroundColor: NSColor? {
        get {
            guard let layer = layer, let backgroundColor = layer.backgroundColor else {return nil}
            return NSColor(cgColor: backgroundColor)
        }
        set {
            wantsLayer = true
            layer?.backgroundColor = newValue?.cgColor
        }
    }
    
}

