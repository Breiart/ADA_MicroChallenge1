//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit


class GameScene: SKScene {
    
    private var label : SKLabelNode!
    var background = SKSpriteNode(imageNamed: "banda_Blu")
    
    override func didMove(to view: SKView) {
        background.zPosition = 0
        background.scale(to: CGSize(width: 2560, height: 1600))
        background.position = CGPoint(x: 0, y: 0)
        
        addChild(background)

        addPlayButton()
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch == touches.first {
                enumerateChildNodes(withName: "//*", using: { (node, stop) in
                    if node.name == "playButton" {
                        if node.contains(touch.location(in: self)) {
                            let scale = SKAction.scale(to: 0.7, duration: 0)
                            node.run(scale)
                            
                            let moveIn = SKTransition.crossFade(withDuration: 1.5)
                            if let scene2 = FirstScene(fileNamed: "GameScene2") {
                                scene2.scaleMode = .aspectFill
                                
                                sceneView.presentScene(scene2, transition: moveIn)
                            }
                        }
                        
                    }
                })
            }
        }
    }
    
    func addPlayButton() {
        let playButton = SKSpriteNode(imageNamed: "play_button")
        playButton.name = "playButton"
        playButton.position = CGPoint.init(x: 0, y: -225)
        addChild(playButton)
    }

    
    
    
}

class FirstScene : SKScene {
    
    private var label : SKLabelNode!

    override func didMove(to view: SKView) {
        let backgroundSound = SKAudioNode(fileNamed: "bg.mp3")
        addChild(backgroundSound)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch == touches.first {
                enumerateChildNodes(withName: "//*", using: { (node, stop) in
                    if node.name == "" {
                        if node.contains(touch.location(in: self)) {
                            let scale = SKAction.scale(to: 0.7, duration: 0)
                            node.run(scale)
                        }
                    }
                        
                })
            }
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch == touches.first {
                enumerateChildNodes(withName: "//*", using: { (node, stop) in
                    if node.name == "playButton" {
                        let scale = SKAction.scale(to: 1, duration: 0)
                        node.run(scale)
                    }
                })
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch == touches.first {
                enumerateChildNodes(withName: "//*", using: { (node, stop) in
                    if node.name == "playButton" {
                        if !node.contains(touch.location(in: self)) {
                            let scale = SKAction.scale(to: 1, duration: 0)
                            node.run(scale)
                        }
                    }
                })
            }
        }
    }



    func addClickableCharacter(named: String) {
        var clickableCharacter = SKSpriteNode()
        clickableCharacter.name = "\(named)"
        clickableCharacter = self.childNode(withName : "\(named)") as! SKSpriteNode
        
        addChild(clickableCharacter)
    }

}

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 2560, height: 1600))
if let scene = GameScene(fileNamed: "GameScene") {
    scene.scaleMode = .aspectFill
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
