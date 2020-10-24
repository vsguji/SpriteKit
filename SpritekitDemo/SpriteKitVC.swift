//
//  ViewController.swift
//  SpritekitDemo
//
//  Created by 李朋 on 2020/10/24.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //
        // 1.创建场景
        sceneView.backgroundColor = .red
        sceneView.center = view.center
        view.addSubview(sceneView)
        
        mainScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        
        // 2.设置精灵
        let imgScene = SKSpriteNode(imageNamed: "f78ec8ee-6eb4-46df-8204-22bc40178469")
        mainScene.addChild(imgScene)
        
        // 3.场景中呈现精灵
        if let skView = sceneView as? SKView {
            skView.presentScene(mainScene)
        }
    }
    
    fileprivate lazy var sceneView:SKView = SKView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    fileprivate lazy var mainScene:SKScene = SKScene(size: sceneView.bounds.size)

}

