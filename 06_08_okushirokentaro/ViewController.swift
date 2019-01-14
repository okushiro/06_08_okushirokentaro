//
//  ViewController.swift
//  06_08_okushirokentaro
//
//  Created by 奥城健太郎 on 2019/01/13.
//  Copyright © 2019 奥城健太郎. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override var prefersStatusBarHidden: Bool { return true }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation { return .slide }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        
        // 回転運動関数
        func doRotation(_ time: Double) -> SCNAction {
            let rotation = SCNAction.rotateBy(x: 0, y: CGFloat(Double(2) * .pi), z: 0, duration: time)
            let foreverRotation = SCNAction.repeatForever(rotation)
            return foreverRotation
        }

        //軸
        let axis = SCNVector3(0, 0, -10)

        // 太陽
        let sun = SCNSphere(radius: 1.5)
        sun.firstMaterial?.diffuse.contents = UIImage(named: "sun")

        let sunNode = SCNNode(geometry: sun)
        scene.rootNode.addChildNode(sunNode)
        sunNode.position = axis
        sunNode.runAction(doRotation(3))


        // 水星
        let mercuryAxis = SCNNode()
        scene.rootNode.addChildNode(mercuryAxis)
        mercuryAxis.position = axis
        mercuryAxis.runAction(doRotation(10))

        let mercury = SCNSphere(radius: 0.1)
        mercury.firstMaterial?.diffuse.contents = UIImage(named: "mercury")

        let mercuryNode = SCNNode(geometry: mercury)
        mercuryAxis.addChildNode(mercuryNode)
        mercuryNode.position = SCNVector3(2, 0, 0)
        mercuryNode.runAction(doRotation(5))


        // 金星
        let venusAxis = SCNNode()
        scene.rootNode.addChildNode(venusAxis)
        venusAxis.position = axis
        venusAxis.runAction(doRotation(20))

        let venus = SCNSphere(radius: 0.1)
        venus.firstMaterial?.diffuse.contents = UIImage(named: "venus")

        let venusNode = SCNNode(geometry: venus)
        venusAxis.addChildNode(venusNode)
        venusNode.position = SCNVector3(3, 0, 0)
        venusNode.runAction(doRotation(20))


        // 地球
        let earthAxis = SCNNode()
        scene.rootNode.addChildNode(earthAxis)
        earthAxis.position = axis
        earthAxis.runAction(doRotation(36))

        let earth = SCNSphere(radius: 0.2)
        earth.firstMaterial?.diffuse.contents = UIImage(named: "earth")

        let earthNode0 = SCNNode()
        let earthNode = SCNNode(geometry: earth)
        earthAxis.addChildNode(earthNode0)
        earthNode0.addChildNode(earthNode)
        earthNode0.position = SCNVector3(5, 0, 0)
        earthNode.runAction(doRotation(0.1))


        // 月
        let moonAxis = SCNNode()
        earthNode0.addChildNode(moonAxis)
        moonAxis.position = SCNVector3(0, 0, 0)
        moonAxis.runAction(doRotation(3))

        let moon = SCNSphere(radius: 0.05)
        moon.firstMaterial?.diffuse.contents = UIImage(named: "moon")

        let moonNode = SCNNode(geometry: moon)
        moonAxis.addChildNode(moonNode)
        moonNode.position = SCNVector3(0.4, 0, 0)


        // 火星
        let marsAxis = SCNNode()
        scene.rootNode.addChildNode(marsAxis)
        marsAxis.position = axis
        marsAxis.runAction(doRotation(68))

        let mars = SCNSphere(radius: 0.2)
        mars.firstMaterial?.diffuse.contents = UIImage(named: "mars")

        let marsNode = SCNNode(geometry: mars)
        marsAxis.addChildNode(marsNode)
        marsNode.position = SCNVector3(8, 0, 0)
        marsNode.runAction(doRotation(0.1))


        // 木星
        let jupiterAxis = SCNNode()
        scene.rootNode.addChildNode(jupiterAxis)
        jupiterAxis.position = axis
        jupiterAxis.runAction(doRotation(330))

        let jupiter = SCNSphere(radius: 0.5)
        jupiter.firstMaterial?.diffuse.contents = UIImage(named: "jupiter")

        let jupiterNode = SCNNode(geometry: jupiter)
        jupiterAxis.addChildNode(jupiterNode)
        jupiterNode.position = SCNVector3(12, 0, 0)
        jupiterNode.runAction(doRotation(0.1))


        // 土星
        let saturnAxis = SCNNode()
        scene.rootNode.addChildNode(saturnAxis)
        saturnAxis.position = axis
        saturnAxis.runAction(doRotation(1000))

        let saturn = SCNSphere(radius: 0.5)
        saturn.firstMaterial?.diffuse.contents = UIImage(named: "saturn")

        let saturnNode = SCNNode(geometry: saturn)
        saturnAxis.addChildNode(saturnNode)
        saturnNode.position = SCNVector3(15, 0, 0)
        saturnNode.runAction(doRotation(0.1))

        let ring = SCNText(string: "○", extrusionDepth: 0.1)
        ring.firstMaterial?.diffuse.contents = UIColor(red: 1.0, green: 0.8, blue: 0.8, alpha: 0.8)
        let ringNode = SCNNode(geometry: ring)
        ringNode.scale = SCNVector3(0.2, 0.2, 0.2)
        saturnNode.addChildNode(ringNode)
        ringNode.position = SCNVector3(-1.05, 0, -1.5)
        ringNode.runAction(SCNAction.rotateBy(x: CGFloat(Float.pi/2), y: 0, z: 0, duration: 0.1))


        // 天王星
        let uranusAxis = SCNNode()
        scene.rootNode.addChildNode(uranusAxis)
        uranusAxis.position = axis
        uranusAxis.runAction(doRotation(2400))

        let uranus = SCNSphere(radius: 0.3)
        uranus.firstMaterial?.diffuse.contents = UIImage(named: "uranus")

        let uranusNode = SCNNode(geometry: uranus)
        uranusAxis.addChildNode(uranusNode)
        uranusNode.position = SCNVector3(20, 0, 0)
        uranusNode.runAction(doRotation(0.1))


        // 海王星
        let neptuneAxis = SCNNode()
        scene.rootNode.addChildNode(neptuneAxis)
        neptuneAxis.position = axis
        neptuneAxis.runAction(doRotation(5000))

        let neptune = SCNSphere(radius: 0.3)
        neptune.firstMaterial?.diffuse.contents = UIImage(named: "neptune")

        let neptuneNode = SCNNode(geometry: neptune)
        neptuneAxis.addChildNode(neptuneNode)
        neptuneNode.position = SCNVector3(25, 0, 0)
        neptuneNode.runAction(doRotation(0.1))


        // 彗星
        let cometAxis = SCNNode()
        scene.rootNode.addChildNode(cometAxis)
        cometAxis.position = SCNVector3(18, 10, -13)
        cometAxis.runAction(doRotation(10))

        let comet = SCNSphere(radius: 0.1)
        comet.firstMaterial?.diffuse.contents = UIColor.blue

        let cometNode = SCNNode(geometry: comet)
        cometAxis.addChildNode(cometNode)
        cometNode.position = SCNVector3(5,0,0)
        cometNode.runAction(SCNAction.repeatForever(SCNAction.sequence([
            SCNAction.moveBy(x: 0, y: -12, z: 0, duration: 5),
            SCNAction.moveBy(x: 0, y: 12, z: 0, duration: 5),
        ])))
        cometNode.runAction(SCNAction.repeatForever(SCNAction.sequence([
            SCNAction.moveBy(x: 20, y: 0, z: 0, duration: 5),
            SCNAction.moveBy(x: -20, y: 0, z: 0, duration: 5),
        ])))
        
        let tail = SCNText(string: "三", extrusionDepth: 0.2)
        tail.firstMaterial?.diffuse.contents = UIColor.blue
        let tailNode = SCNNode(geometry: tail)
        tailNode.scale = SCNVector3(0.03, 0.01, 0.03)
        cometNode.addChildNode(tailNode)
        tailNode.position = SCNVector3(0, -0.08, 0.45)
        tailNode.runAction(SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi/2), z: 0, duration: 0.1))
        
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
