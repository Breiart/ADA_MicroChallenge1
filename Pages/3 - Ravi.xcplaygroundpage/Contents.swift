//: [Previous](@previous)

import SpriteKit
import PlaygroundSupport

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        if scene?.name == "RaviScena" {
            addTransButton()
        } else if scene?.name == "RaviStory" {
            let backgroundSound = SKAudioNode(fileNamed: "bg.mp3")
            addChild(backgroundSound)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch == touches.first {
                enumerateChildNodes(withName: "//*", using: { (node, stop) in
                    if node.name == "transButton" {
                        if node.contains(touch.location(in: self)) {
                            let scale = SKAction.scale(to: 0.7, duration: 0)
                            node.run(scale)
                            
                            
                            let moveIn = SKTransition.crossFade(withDuration: 1.5)
                            if let scene2 = GameScene(fileNamed: "GameScene_Chap3") {
                                scene2.scaleMode = .aspectFill
                                
                                sceneView.presentScene(scene2, transition: moveIn)
                            }
                        }
                    }
                })
            }
        }
    }
    
    func addTransButton() {
        let transButton = SKSpriteNode(imageNamed: "transButton")
        transButton.name = "transButton"
        transButton.position = CGPoint.init(x: 0, y: 0)
        transButton.scale(to: CGSize(width: 329, height: 586.5))
        addChild(transButton)
    }
}

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 2560, height: 1600))
if let scene = GameScene(fileNamed: "RaviScene") {
    scene.scaleMode = .aspectFill
    
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

//: [Next](@next)
