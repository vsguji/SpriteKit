//
//  ViewController.swift
//  SpritekitDemo
//
//  Created by 李朋 on 2020/10/24.
//

import UIKit
import SpriteKit
import SceneKit

// 绘制节点 https://developer.apple.com/documentation/spritekit/nodes_for_scene_building#2242745
// 显示图像，形状，粒子，文本，视频，图块，甚至3D内容

class SpriteKitVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //
        // 1.创建场景
        sceneView.backgroundColor = .red
        sceneView.center = view.center
        view.addSubview(sceneView)
        
        mainScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        // 2.显示图像
        // showImage()
        // 2.显示形状
//         showShape()
        // 2. 显示粒子
//        showParticles()
        // 2. 显示文本
//         showTextNode()
        // 2. 显示视频
//        showVideoNode()
        // 2. 显示图块
//        showPicTextureNode()
        // 2. 显示3D内容
         show3DNode()
        
        // 3.场景中呈现精灵
        if let skView = sceneView as? SKView {
            skView.presentScene(mainScene)
        }
    }
    
//    fileprivate lazy var sceneView:SKView = SKView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    // 粒子场景
    fileprivate lazy var sceneView:SKView = SKView(frame: view.bounds)
    
    fileprivate lazy var mainScene:SKScene = SKScene(size: sceneView.bounds.size)

    
    /// MARK : - 图像
    
    func showImage() {
        
        let imgScene = SKSpriteNode(imageNamed: "f78ec8ee-6eb4-46df-8204-22bc40178469")
        mainScene.addChild(imgScene)
    }

    /// MARK : - 形状
    
    func showShape() {
         
        func createPath() -> CGPath {
            let targetRect = sceneView.bounds.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
            let path = CGPath(rect: targetRect, transform: nil)
            return path
        }
        
       
        func createPath1() -> CGPath {
            let targetRect = sceneView.bounds.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
            let path = CGPath(rect: targetRect, transform: nil)
            // CGPath 创建方式
            return path
        }
        
        
        func createShapeNode(_ path:CGPath) -> SKShapeNode {
            // 1.从路径创建形状
            /// 1.1从“核心图形”路径创建形状节点。 (https://developer.apple.com/documentation/spritekit/skshapenode/1520022-init)
            /// SKScene.anchorPoint = CGPoint(x: 0., y: 0)  , 区域内全显示
             /// let node = SKShapeNode(path: path)
             /// 1.2从“核心图形”路径以其位置为中心创建形状节点。
            ///  SKScene.anchorPoint = CGPoint(x: 0.5, y: 0.5), 区域内全显示
            ///   let node = SKShapeNode(path: path, centered: true)  (https://developer.apple.com/documentation/spritekit/skshapenode/1519649-init)
            /// 1.3 定义形状的路径。(https://developer.apple.com/documentation/spritekit/skshapenode/1519741-path)
            /// var path: CGPath? { get set }
            ///    let node = SKShapeNode()
            ///    node.path = path
            ///
            
             // 2. 从矩形创建形状
            /// 2.1 创建具有矩形路径的形状节点。(https://developer.apple.com/documentation/spritekit/skshapenode/1520047-init)
            ///  let insetRect = sceneView.bounds.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
            ///  let node = SKShapeNode(rect: insetRect)
            /// 2.2 创建一个形状节点，其矩形路径以节点的原点为中心。(https://developer.apple.com/documentation/spritekit/skshapenode/1520147-init)
            ///  SKScene.anchorPoint = CGPoint(x: 0.5, y: 0.5), 区域内全显示
            /// let size = sceneView.bounds.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)).size
            ///  let node = SKShapeNode(rectOf: size)
            /// 2.3 创建具有带有圆角的矩形路径的形状。(https://developer.apple.com/documentation/spritekit/skshapenode/1519769-init)
            /// let insetRect = sceneView.bounds.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
            ///  let node = SKShapeNode(rect: insetRect, cornerRadius: 8)
            /// 2.4 用矩形路径创建一个形状，该形状的圆角以节点的位置为中心。(https://developer.apple.com/documentation/spritekit/skshapenode/1519712-init)
              ///  let size =  sceneView.bounds.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)).size
              ///  let cornerRadius = size.width / 2
              ///  let node = SKShapeNode(rectOf: size, cornerRadius: cornerRadius)
            ///
            
            // 3. 创建圆形
            /// 创建一个形状节点，其圆形路径以节点的原点为中心。(https://developer.apple.com/documentation/spritekit/skshapenode/1519570-init)
            ///  SKScene.anchorPoint = CGPoint(x: 0.5, y: 0.5), 区域内全显示
            ///  let size =  sceneView.bounds.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)).size
           ///   let cornerRadius = size.width / 2
           ///  let node = SKShapeNode(circleOfRadius: cornerRadius)
            ///
            
            // 4. 创建椭圆形(正圆是特殊）
            /// 4.1  创建一个形状节点，其椭圆路径以节点的原点为中心。(https://developer.apple.com/documentation/spritekit/skshapenode/1519980-init)
            /// SKScene.anchorPoint = CGPoint(x: 0., y: 0.), 区域内全显示
           /// let insetRect = sceneView.bounds.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
           /// let node = SKShapeNode(ellipseIn: insetRect)
            /// 4.2 创建一个具有椭圆形路径的形状节点，该形状节点填充指定的矩形。(https://developer.apple.com/documentation/spritekit/skshapenode/1520412-init)
            /// SKScene.anchorPoint = CGPoint(x: 0.5, y: 0.5), 区域内全显示
            /// let insetRect = sceneView.bounds.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
            /// let size = insetRect.size
            /// let node = SKShapeNode(ellipseOf: size)
            ///
            
            // 5.从点阵列创建形状
            /// 5.1 从一系列点创建形状节点
            /// SKScene.anchorPoint = CGPoint(x: 0., y: 0)  , 区域内全显示
            let insetRect = sceneView.bounds.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
            let x = insetRect.origin.x
            let y = insetRect.origin.y
            var points = [CGPoint(x: x, y: y),
                          CGPoint(x: x + insetRect.size.width, y: y),
                          CGPoint(x: x + insetRect.size.width, y: y + insetRect.size.height),
                          CGPoint(x:x , y: y + insetRect.size.height ),
                          CGPoint(x: x, y: y)]
           let node = SKShapeNode(points: &points, count: 5) //(https://developer.apple.com/documentation/spritekit/skshapenode/creating_a_shape_node_from_an_array_of_points)
            /// 5.2 根据一系列样条点创建形状节点。(https://developer.apple.com/documentation/spritekit/skshapenode/1520140-init)
            /// SKScene.anchorPoint = CGPoint(x: 0., y: 0)  , 区域内全显示
//            let insetRect = sceneView.bounds.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//            let x = insetRect.origin.x
//            let y = insetRect.origin.y
//            var points = [CGPoint(x: x + 4, y: y - 4),
//                          CGPoint(x: x + insetRect.size.width - 4, y: y - 4),
//                          CGPoint(x: x + insetRect.size.width - 4, y: y + insetRect.size.height - 4),
//                          CGPoint(x:x + 4 , y:y + insetRect.size.height - 4 ),
//                          CGPoint(x: x + 4, y: y - 4)]
//            let node = SKShapeNode(splinePoints: &points, count: 5) // (https://developer.apple.com/documentation/spritekit/skshapenode/creating_a_shape_node_from_an_array_of_points)
            return node
        }
        
        func drawPath (_ node:SKShapeNode) {
            
            // 1.填充形状
            /// 用于填充形状的颜色。(https://developer.apple.com/documentation/spritekit/skshapenode/1520154-fillcolor)
            node.fillColor = SKColor.red
            /// 用于填充形状的纹理。(https://developer.apple.com/documentation/spritekit/skshapenode/1519956-filltexture)
            /// 默认值为nil。如果指定了填充纹理，则将形状节点与fillColor混合使用来渲染形状节点
            let texture = SKTexture(imageNamed: "f78ec8ee-6eb4-46df-8204-22bc40178469")
            node.fillTexture = texture
            ///
            // 2. 绘制形状
            /// 2.1 用于描画路径的宽度。
            node.lineWidth = 2
            /// 2.2 从描边向外延伸的辉光,默认值为0，表示不添加任何光晕。发光颜色由trokeColor确定
            /// (https://developer.apple.com/documentation/spritekit/skshapenode/1520116-glowwidth)
            node.glowWidth = 2
            /// 2.3 用于描画形状的颜色。（ https://developer.apple.com/documentation/spritekit/skshapenode/1519748-strokecolor）
            node.strokeColor = SKColor.yellow
            /// 2.4 用于描画形状的纹理  (https://developer.apple.com/documentation/spritekit/skshapenode/1519824-stroketexture)
            node.strokeTexture = SKTexture(vectorNoiseWithSmoothness: 2, size: CGSize(width: 4,height: 4))
            /// 2.5 使用斜接连接样式描边线条时使用的斜接限制。(https://developer.apple.com/documentation/spritekit/skshapenode/1520240-miterlimit)
            /// node.miterLimit = 2
            /// 2.6 一个布尔值，该值确定绘制后的笔划路径是否平滑.(https://developer.apple.com/documentation/spritekit/skshapenode/1519719-isantialiased)
            node.isAntialiased = true
            /// 2.7 用于渲染形状节点的笔触部分的端点的样式。(https://developer.apple.com/documentation/spritekit/skshapenode/1520360-linecap)
            /// node.lineCap = .butt / / 带有平方末端的线。核心图形绘制线以仅延伸到路径的确切端点。这是默认值。
            /// node.lineCap = .round / / 带有圆形末端的线。核心图形绘制线以延伸到路径的端点之外。该线以半圆弧结束，半径为线宽的1/2，以端点为中心。
            node.lineCap = .square // 带有平方末端的线。核心图形将线延伸到路径的终点之外，其距离等于线宽的一半。
            /// 2.8 渲染形状节点的笔触部分时使用的结点类型。(https://developer.apple.com/documentation/spritekit/skshapenode/1520358-linejoin)
           ///  node.lineJoin = .round  / /  圆角的连接。核心图形绘制线以延伸到路径的端点之外。该线以半圆弧结束，半径为线宽的1/2，以端点为中心。
            node.lineJoin = .round // 具有平方尾的连接。Core Graphics绘制线条以超出路径的端点延伸，其距离为线条宽度的1/2。
           /// node.lineJoin = .miter // 略
            ///
            
            // 3.配置Alpha混合
            /// 混合模式用于将形状混合到父级的帧缓冲区中。
            /// 描述如何使用源像素和目标像素颜色计算新目标颜色的模式。(https://developer.apple.com/documentation/spritekit/skblendmode)
             ///           node.blendMode = .alpha // 通过将源alpha值相乘来混合源颜色和目标颜色。
            ///            node.blendMode = .add  // 源和目标颜色被添加在一起。
            ///            node.blendMode = .subtract // 从目标颜色中减去源颜色。
            ///            node.blendMode = .multiply // 源颜色乘以目标颜色。
            ///            node.blendMode = .multiplyX2 // 源颜色乘以目标颜色，然后加倍。
            ///            node.blendMode = .screen    // 将源颜色添加到目标颜色乘以反转的源颜色。
            node.blendMode = .replace   // 源颜色替换目标颜色。
            ///            node.blendMode = .multiplyAlpha  // 枚举案例
            node.alpha = 1  // 将精灵与不同的Alpha解释混合
            ///
            
            // 4 只读 控制或动画行程长度   调整或动画形状的笔触。(https://developer.apple.com/documentation/spritekit/skshapenode/1520398-linelength)
            /// 形状节点定义的线的长度。
             ///  var lineLength: CGFloat { get }
            /// node.lineLength = 4
            ///
            
            // 5.自定义描边或填充图形；
            /// 5.1 通过提供自定义代码文件来控制描边描边或填充的每像素控制。
            /// 自定义着色器，用于确定形状节点的描边部分的颜色。 (https://developer.apple.com/documentation/spritekit/skshapenode/1519784-strokeshader)
            /// node.strokeShader = 自定义
            /// 5.2 自定义着色器，用于确定形状节点的填充部分的颜色。(https://developer.apple.com/documentation/spritekit/skshapenode/1519629-fillshader)
            /// node.fillShader = 自定义
            /// 5.3 与节点的附加着色器关联的每个属性的值  (https://developer.apple.com/documentation/spritekit/skshapenode/2715841-attributevalues)
            /// node.attributeValues =
             ///5.4  为附加的着色器设置属性值  (https://developer.apple.com/documentation/spritekit/skshapenode/2715855-setvalue)
             /// node.setValue(<#T##value: SKAttributeValue##SKAttributeValue#>, forAttribute: <#T##String#>)
             ///5.5 着色器属性的值。 (https://developer.apple.com/documentation/spritekit/skshapenode/2715843-value)
             /// node.value(forAttributeNamed: <#T##String#>)
            mainScene.addChild(node)
        }
        
        
        drawPath(createShapeNode(createPath()))
    }
    
    /// MARK : - 粒子
    
    func showParticles(){
        // 修改
        ///  fileprivate lazy var sceneView:SKView = SKView(frame: view.bounds)
        ///  mainScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        /// 1.创建.sks文件到工程
        /// 2.代码配置 粒子
         /// let newMakeEmitter = SKEmitterNode(fileNamed: "MyParticle01.sks")!
        /// 采用编辑器 https://help.apple.com/xcode/mac/current/#/dev0bfaf1ab7
        // 3.修改属性
        
        // 3.1 选择场景中的哪个节点发出粒子
        /// 渲染发射器粒子的目标节点。(https://developer.apple.com/documentation/spritekit/skemitternode/1398012-targetnode)
        newMakeEmitter.position = CGPoint.zero
        newMakeEmitter.name = "myParticle"
        /// 3.当发射器具有目标节点时，它将计算粒子的位置，速度和方向，就像它是精灵节点的子代一样。这意味着，如果旋转船舶精灵，
        /// 排气方向也将自动旋转。但是，在计算新粒子的起始值时，这些值将转换为目标节点的坐标系。此后，它们将仅受目标节点更改的影响。
        newMakeEmitter.zPosition = -10
        newMakeEmitter.targetNode = mainScene
        
        // 3.2 控制何时创建粒子
        /// 3.2.1 进行发射器粒子仿真。(https://developer.apple.com/documentation/spritekit/skemitternode/1398027-advancesimulationtime)
        ///  newMakeEmitter.advanceSimulationTime()
        /// 3.2.2 删除所有现有粒子并重新启动仿真。(https://developer.apple.com/documentation/spritekit/skemitternode/1398053-resetsimulation)
        /// newMakeEmitter.resetSimulation()
        /// 3.2.3 创建新粒子的速率。(https://developer.apple.com/documentation/spritekit/skemitternode/1398039-particlebirthrate)
        newMakeEmitter.particleBirthRate = 1 // 发射器每秒产生的粒子数。默认值为。0.0
        /// 3.2.4 停止之前，发射器应发射的粒子数。（https://developer.apple.com/documentation/spritekit/skemitternode/1398043-numparticlestoemit）
        newMakeEmitter.numParticlesToEmit = 8 // 默认值为0，表示发射器创建无尽的粒子流。如果提供非零值，则发射器在创建指定数量的粒子后将停止生成粒子。
        ///
        
        // 3.3 控制发射器粒子的渲染顺序
        /// 3.3.1 发射器粒子的渲染顺序。 (https://developer.apple.com/documentation/spritekit/skemitternode/1397986-particlerenderorder)
       /// newMakeEmitter.particleRenderOrder = .oldestLast // 从最新到最旧渲染粒子。这是默认值。
       /// newMakeEmitter.particleRenderOrder = .oldestFirst // 从最旧到最新渲染粒子。
        newMakeEmitter.particleRenderOrder  = .dontCare // 可以按任何顺序渲染粒子。SpriteKit可以选择对粒子重新排序以提高渲染性能。
        ///
        
       // 3.4 控制粒子寿命
        /// 3.4.1 粒子的平均寿命，以秒为单位。(https://developer.apple.com/documentation/spritekit/skemitternode/1398000-particlelifetime)
        /// newMakeEmitter.particleLifetime = 5
        /// 3.4.2 粒子寿命的允许随机值范围。(https://developer.apple.com/documentation/spritekit/skemitternode/1397994-particlelifetimerange)
        /// newMakeEmitter.particleLifetimeRange = 10 // 默认值为。如果不为零，则每个粒子的寿命是随机确定的，并且可能会变化范围值的正负一半。0.0
        ///
        
        // 3.5 控制粒子位置
        /// 3.5.1 粒子的平均起始位置。(https://developer.apple.com/documentation/spritekit/skemitternode/1398019-particleposition)
        ///  newMakeEmitter.particlePosition = CGPoint(x: 100, y: 100)
        /// 3.5.2 粒子位置允许的随机值范围。(https://developer.apple.com/documentation/spritekit/skemitternode/1397972-particlepositionrange)
        newMakeEmitter.particlePositionRange = CGVector(dx: 100, dy: 100)// 默认值为。如果某个分量不为零，则将随机确定粒子位置的同一分量
        /// ,并且其变化可能是范围值的正负一半。(0.0,0.0)
        /// 3.5.3 粒子的平均起始深度。默认值为。0.0（https://developer.apple.com/documentation/spritekit/skemitternode/1398055-particlezposition）
        newMakeEmitter.particleZPosition = 10
        ///
        
        // 3.6 控制粒子速度和加速度
        /// 3.6.1 新粒子的平均初始速度，以每秒点数为单位。(https://developer.apple.com/documentation/spritekit/skemitternode/1398061-particlespeed)
        /// newMakeEmitter.particleSpeed = 20
        /// 3.6.2 粒子初始速度的允许随机值范围。(https://developer.apple.com/documentation/spritekit/skemitternode/1398045-particlespeedrange)
        newMakeEmitter.particleSpeedRange = 20 // 默认值为。如果不为零，则每个粒子的速度是随机确定的，并且可能会在范围值的正负一半之间变化。0.0
        /// 3.6.3 粒子的平均初始方向，以弧度表示。(https://developer.apple.com/documentation/spritekit/skemitternode/1398035-emissionangle)
        newMakeEmitter.emissionAngle = 30
        /// 3.6.4 粒子初始方向允许的随机值范围，以弧度表示。(https://developer.apple.com/documentation/spritekit/skemitternode/1398067-emissionanglerange)
        /// newMakeEmitter.emissionAngleRange = 30 // 默认值为。如果不为零，则每个粒子的发射角都是随机确定的，并且可能会在范围值的正负一半之间变化。0.0
        /// 3.6.5 应用于粒子水平速度的加速度。(https://developer.apple.com/documentation/spritekit/skemitternode/1398017-xacceleration)
        newMakeEmitter.xAcceleration = 50 // 此属性对于模拟风，重力和其他效果很有用。它均匀地应用于发射器产生的所有粒子, 默认值为。0.0
        /// 3.6.6 应用于粒子垂直速度的加速度。(https://developer.apple.com/documentation/spritekit/skemitternode/1397982-yacceleration)
        newMakeEmitter.yAcceleration = 50 //此属性对于模拟风，重力和其他效果很有用。它均匀地应用于发射器产生的所有粒子。默认值为。0.0
        ///
        
        // 3.7 调整粒子的旋转
        /// 3.7.1 粒子的平均初始旋转度，以弧度表示。(https://developer.apple.com/documentation/spritekit/skemitternode/1398025-particlerotation)
        /// newMakeEmitter.particleRotation = 30
        /// 3.7.2 粒子初始旋转的允许随机值范围，以弧度表示。
         /// newMakeEmitter.particleRotationRange = 30 (https://developer.apple.com/documentation/spritekit/skemitternode/1397996-particlerotationrange)
        /// 3.7.3 粒子旋转的速度，以每秒弧度表示。(https://developer.apple.com/documentation/spritekit/skemitternode/1397968-particlerotationspeed)
        newMakeEmitter.particleRotationSpeed = 10
        ///
        
        // 3.8 按比例缩放粒子
        /// 3.8.1 粒子的平均初始比例因子。默认值为。1.0(https://developer.apple.com/documentation/spritekit/skemitternode/1398014-particlescale)
        newMakeEmitter.particleScale = 1.5
        /// 3.8.2 粒子初始比例的允许随机值范围。(https://developer.apple.com/documentation/spritekit/skemitternode/1397990-particlescalerange)
        newMakeEmitter.particleScaleRange = 1.5
        /// 3.8.3 粒子比例因子每秒变化的速率。默认值为。0.0 (https://developer.apple.com/documentation/spritekit/skemitternode/1398073-particlescalespeed)
        newMakeEmitter.particleScaleSpeed = 1
        /// 3.8.4 用于指定粒子在其生命周期内的比例因子的顺序。(https://developer.apple.com/documentation/spritekit/skemitternode/1398029-particlescalesequence)
        /// 默认值为nil。如果非nil指定的值，那么 particleScale 、particleScaleRange和particleScaleSpeed属性将被忽略。相反，该序列用于指定比例因子。
        /// 在不同时间（关键帧）指定的值之间执行插值的对象。
        /// SKKeyframeSequence对象的主要用途是使SKEmitterNode对象发射的粒子具有动画属性，但它也可以用于跨越离散输入集的一般插值需求。
        /// 当关键帧序列与发射器节点一起使用时，粒子通过采样关键帧序列来确定它们的值。该序列替换了发射器节点执行的常规模拟。
        ///newMakeEmitter.particleScaleSequence = //.
        ///
        
        // 3.9 更改粒子的源图像和大小
        /// 3.9.1 用于渲染粒子的纹理。(https://developer.apple.com/documentation/spritekit/skemitternode/1398004-particletexture)
        /// 粒子被渲染，就好像它是一个SKSpriteNode对象。默认值为nil，这意味着使用一个彩色矩形来绘制粒子。如果指定了一个非nil值，那么纹理将着色并用于绘制粒子。
        newMakeEmitter.particleTexture = SKTexture(imageNamed: "f78ec8ee-6eb4-46df-8204-22bc40178469")
        /// 3.9.2 每个粒子的起始大小（https://developer.apple.com/documentation/spritekit/skemitternode/1398063-particlesize）
        newMakeEmitter.particleSize = CGSize(width: 40, height: 40)
        ///
        
        // 3.10 配置粒子颜色
        /// 3.10.1 用于指定粒子在其生命周期中颜色分量的顺序。(https://developer.apple.com/documentation/spritekit/skemitternode/1397992-particlecolorsequence)
        /// 默认值是nil。如果指定了非nil值，则忽略particleColor、particleColorAlphaRange、particleColorRedRange、particlecolorgreenerange、particleColorAlphaSpeed、particleColorRedSpeed、particleColorGreenSpeed和particleColorBlueSpeed属性。
        /// 相反,序列用于指定粒子的颜色。
        /// 如果你使用Xcode的粒子编辑器创建一个SKEmitterNode对象，它会使用一个颜色序列来实现颜色变化。
        /// newMakeEmitter.particleColorSequence =
        /// 3.10.2 粒子的平均初始颜色。(https://developer.apple.com/documentation/spritekit/skemitternode/1398049-particlecolor)
        newMakeEmitter.particleColor = SKColor.red
        /// 3.10.3 粒子初始颜色的alpha分量的允许随机值范围。(https://developer.apple.com/documentation/spritekit/skemitternode/1397976-particlecoloralpharange)
        /// newMakeEmitter.particleColorAlphaRange = 10
        /// 3.10.4 粒子初始颜色的蓝色分量的允许随机值范围。(https://developer.apple.com/documentation/spritekit/skemitternode/1398075-particlecolorbluerange)
        /// newMakeEmitter.particleColorBlueRange = 10
        /// 3.10.5  粒子初始颜色的绿色分量的允许随机值范围。(https://developer.apple.com/documentation/spritekit/skemitternode/1398065-particlecolorgreenrange)
        /// newMakeEmitter.particleColorGreenRange = 10
        /// 3.10.6 粒子初始颜色的红色分量的允许随机值范围。(https://developer.apple.com/documentation/spritekit/skemitternode/1397998-particlecolorredrange)
        /// newMakeEmitter.particleColorRedRange = 10
        /// 3.10.7 粒子颜色的alpha成分每秒变化的速率。(https://developer.apple.com/documentation/spritekit/skemitternode/1398051-particlecoloralphaspeed)
        /// newMakeEmitter.particleColorAlphaSpeed = 10
        /// 3.10.8 粒子颜色的蓝色成分每秒变化的速率。(https://developer.apple.com/documentation/spritekit/skemitternode/1398023-particlecolorbluespeed)
        /// newMakeEmitter.particleColorBlueSpeed = 10
        /// 3.10.9 粒子颜色的绿色分量每秒变化的速率。(https://developer.apple.com/documentation/spritekit/skemitternode/1398033-particlecolorgreenspeed)
        newMakeEmitter.particleColorGreenSpeed = 10
        /// 3.10.9 粒子颜色的红色分量每秒变化的速率。(https://developer.apple.com/documentation/spritekit/skemitternode/1398041-particlecolorredspeed)
        newMakeEmitter.particleColorRedSpeed = 10
        ///
        
        // 3.11 控制纹理与粒子颜色的混合方式
        /// 3.11.1  用于指定粒子在其生命周期内的颜色混合因子的顺序。(https://developer.apple.com/documentation/spritekit/skemitternode/1397980-particlecolorblendfactorsequence)
        /// 默认值是nil。如果指定了非nil值，则忽略particleColorBlendFactor、particleColorBlendFactorRange和particleColorBlendFactorSpeed属性。相反，序列用于指定颜色混合因子。
        /// newMakeEmitter.particleColorBlendFactorSequence =
        /// 3.11.2 颜色混合因子的平均起始值。(https://developer.apple.com/documentation/spritekit/skemitternode/1398071-particlecolorblendfactor)
        newMakeEmitter.particleColorBlendFactor = 10
        /// 3.11.3 粒子的起始颜色混合因子的允许随机值范围。  (https://developer.apple.com/documentation/spritekit/skemitternode/1398047-particlecolorblendfactorrange)
        newMakeEmitter.particleColorBlendFactorRange = 10
        /// 3.11.4 颜色混合因子每秒变化的速率。(https://developer.apple.com/documentation/spritekit/skemitternode/1398037-particlecolorblendfactorspeed)
        newMakeEmitter.particleColorBlendFactorSpeed = 10
        ///
        
        // 3.12 使用帧缓冲混合粒子
        /// 更改发射器使用Alpha值的方式（例如添加混合），以使发射器比以前更亮。
        /// 3.12.1 混合模式用于将粒子混合到帧缓冲区中。(https://developer.apple.com/documentation/spritekit/skemitternode/1397978-particleblendmode)
        newMakeEmitter.particleBlendMode = .screen
        /// 3.12.2 用于指定粒子在其生命周期内的alpha值的序列。(https://developer.apple.com/documentation/spritekit/skemitternode/1398057-particlealphasequence)
        /// newMakeEmitter.particleAlphaSequence =
        /// 3.12.3 粒子的平均起始Alpha值。(https://developer.apple.com/documentation/spritekit/skemitternode/1397988-particlealpha)
        /// 粒子alpha值等效于该类的alpha属性SKNode。由纹理和颜色混合状态产生的颜色的Alpha分量乘以粒子的Alpha值。然后将生成的粒子颜色与父级的帧缓冲区混合。默认值为。1.0
        /// newMakeEmitter.particleAlpha = 0.8
        /// 3.12.4 粒子起始Alpha值的允许随机值范围。(https://developer.apple.com/documentation/spritekit/skemitternode/1398031-particlealpharange)
         newMakeEmitter.particleAlphaRange = 0.8
        /// 3.12.5 粒子的alpha值每秒变化的速率。默认值为。0.0(https://developer.apple.com/documentation/spritekit/skemitternode/1398021-particlealphaspeed)
        newMakeEmitter.particleAlphaSpeed = 0.8
        ///
        
        // 3.13 动画粒子
        /// 使用动作或关键帧序列随时间改变粒子。
        /// 提供关键帧序列以执行线性或非线性粒子动画。（https://developer.apple.com/documentation/spritekit/skemitternode/animating_particle_properties_across_disparate_values）
        /// 3.13.1 由新粒子执行的动作。（https://developer.apple.com/documentation/spritekit/skemitternode/1397970-particleaction）
        /// newMakeEmitter.particleAction
        ///
        
        // 3.14 将物理场应用于粒子
        /// 3.14.1 定义哪些物理场类别可以对粒子施加力的蒙版。(https://developer.apple.com/documentation/spritekit/skemitternode/1398006-fieldbitmask)
        /// 当一个粒子位于SKFieldNode对象的区域内时，通过执行逻辑和操作，将该字段节点的categoryBitMask属性与发射器的fieldBitMask属性进行比较。
        /// 如果结果是非零值，那么场节点的效应被应用到粒子上，就好像它有一个物理实体。假设物理物体的质量为1。0，电荷为1
        ///
        
        // 3.15 使用着色器完全控制粒子绘制
        /// 粒子着色器入门 (https://developer.apple.com/documentation/spritekit/skemitternode/getting_started_with_particle_shaders)
        /// 提供自定义着色器代码以更改粒子的外观。
        /// 3.15.1 自定义着色器，用于确定如何渲染粒子。(https://developer.apple.com/documentation/spritekit/skemitternode/1398069-shader)
        ///
        /// 3.15.2 与节点的附加着色器关联的每个属性的值。(https://developer.apple.com/documentation/spritekit/skemitternode/2715850-attributevalues)
        ///
        /// 3.15.3 为附加的着色器设置属性值 (https://developer.apple.com/documentation/spritekit/skemitternode/2715854-setvalue)
        ///
        /// 3.15.4 获取着色器属性的值。  (https://developer.apple.com/documentation/spritekit/skemitternode/2715842-value)
        ///
        
        // 3.16 最大化粒子运行时性能
        /// 优化发射器节点性能 (https://developer.apple.com/documentation/spritekit/skemitternode/optimizing_emitter_node_performance)
        /// 使用成熟的方法快速创建和播放性能粒子效果。
        /// 优化方法:
        
//        SpriteKit中的粒子发射器是用于构建视觉效果的最强大的工具之一。但是，如果使用不当，粒子发射器可能会成为应用程序设计和实现的瓶颈。请考虑以下提示：
//
//        使用Xcode创建和测试您的粒子效果，然后将存档加载到游戏中。
//
//        在游戏代码内谨慎调整发射器属性。通常，您执行此操作以指定Xcode检查器中无法指定的属性，或控制游戏逻辑中的属性。
//
//        通过创建具有低出生率的粒子发射器，并为粒子指定较短的寿命，尝试将屏幕上的粒子数量保持在最少。例如，与其每秒创建数百或数千个粒子，不如降低出生率并稍微增加粒子的大小。通常，您可以使用较少的粒子但具有相同的净视觉外观来创建效果。
//
//        仅在没有其他解决方案时才对粒子使用操作。对单个粒子执行动作可能会非常昂贵，尤其是如果粒子发射器的出生率也很高时。
//
//        生成粒子后，只要粒子应独立于发射器节点，就分配目标节点。例如，如果发射器节点在场景中移动或旋转，则粒子应独立。
//
//        当屏幕上看不到粒子发射器时，请考虑将其从场景中移除。在它可见之前添加它。
        
        mainScene.addChild(newMakeEmitter)
        
        let pausedBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        pausedBtn.setTitle("Pause Button", for: .normal)
        pausedBtn.setTitleColor(.red, for: .normal)
        pausedBtn.addTarget(self, action: #selector(showPauseButtton), for: .touchUpInside)
        pausedBtn.center = sceneView.center
        sceneView.addSubview(pausedBtn)
        
        
        let deleteBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        deleteBtn.setTitle("delete Button", for: .normal)
        deleteBtn.setTitleColor(.red, for: .normal)
        deleteBtn.addTarget(self, action: #selector(showDeleteButtton), for: .touchUpInside)
        deleteBtn.center = CGPoint(x: sceneView.center.x, y: sceneView.center.y + 50)
        sceneView.addSubview(deleteBtn)
    }
    
    @objc func showPauseButtton() {
        if newMakeEmitter.isPaused {
            newMakeEmitter.isPaused = false
        }
        else {
            if !newMakeEmitter.isPaused {
                newMakeEmitter.isPaused = true
            }
        }
        newMakeEmitter.advanceSimulationTime(5)
    }
    
    @objc func showDeleteButtton() {
        newMakeEmitter.resetSimulation()
    }
    
    lazy var newMakeEmitter = SKEmitterNode(fileNamed: "MyParticle01.sks")!
    
    
    
    /// MARK : - 显示文本 (https://developer.apple.com/documentation/spritekit/nodes_for_scene_building)
    
    func showTextNode() {
        
        // 向场景添加文本 （https://developer.apple.com/documentation/spritekit/sklabelnode/adding_text_to_a_scene）
        // 使用标签节点在场景中绘制文本，例如运行状况指示器或“游戏结束”横幅。
        // 1 创建标签
        /// 1.1使用指定的字体初始化新的标签对象。(https://developer.apple.com/documentation/spritekit/sklabelnode/1519917-init)
//         let winner = SKLabelNode(fontNamed: "Chalkduster")
//        winner.text = "You Win!"
//        winner.fontSize = 65
//        winner.fontColor = SKColor.green
//        winner.position = CGPoint(x:sceneView.frame.minX,y:sceneView.frame.minY)
//        winner.verticalAlignmentMode = .baseline
//        mainScene.addChild(winner)
        // 每当您更改标签节点的属性时，标签节点将在下一次渲染场景时自动更新。
        ///
    
        /// 1.2 使用文本字符串初始化新的标签对象 (https://developer.apple.com/documentation/spritekit/sklabelnode/1519917-init)
//        let winner = SKLabelNode(text: "You Win！")
//        winner.fontSize = 65
//        winner.fontColor = SKColor.green
//        winner.position = CGPoint(x: sceneView.frame.minX, y: sceneView.frame.minY)
//        mainScene.addChild(winner)
        ///
        
        /// 1.3 使用属性文本字符串初始化新的标签对象。(https://developer.apple.com/documentation/spritekit/sklabelnode/2865816-attributedtext)
//        let winner = SKLabelNode(attributedText:NSAttributedString(string: "You Win!",
//                                                                   attributes:
//                                                                    [NSAttributedString.Key.font:UIFont.fontNames(forFamilyName: "Chalkduster"),
//                                                                    NSAttributedString.Key.foregroundColor:SKColor.red]))
//        winner.fontSize = 65
//        winner.position = CGPoint(x: sceneView.frame.minX, y: sceneView.frame.minY)
//        mainScene.addChild(winner)
        ///
        
        // 2. 设置标签的文字
        /// 2.1 标签的颜色。(https://developer.apple.com/documentation/spritekit/sklabelnode/1520057-fontcolor)
        /// fontColor
        /// 2.2 标签中文本所使用的字体。(https://developer.apple.com/documentation/spritekit/sklabelnode/1520129-fontname)
        /// fontName
        /// 2.3 标签中使用的字体大小。(https://developer.apple.com/documentation/spritekit/sklabelnode/1520208-fontsize)
        /// fontSize
        
        // 3. 控制标签的对齐方式
        /// 3.1 文本在节点内的垂直位置。(https://developer.apple.com/documentation/spritekit/sklabelnode/1519933-verticalalignmentmode)
//         let winner = SKLabelNode(fileNamed: "Chalkduster")
//        winner.text = "You Win!"
//        winner.fontSize = 65
//        winner.fontColor = SKColor.green
//        winner.position = CGPoint(x: sceneView.frame.minX, y: sceneView.frame.minY)
////        winner.verticalAlignmentMode = .baseline
//        mainScene.addChild(winner)
        ///
        
        /// 3.2  垂直对齐文本的选项。(https://developer.apple.com/documentation/spritekit/sklabelverticalalignmentmode)
 //        let winner1 = SKLabelNode(fontNamed: "Chalkduster")
//        winner1.verticalAlignmentMode = .baseline // 放置文本，使字体的基线位于节点的原点上。
//        winner1.verticalAlignmentMode = .center // 将文本垂直居中于节点的原点上。
//        winner1.verticalAlignmentMode = .top // 放置文本，使文本的顶部位于节点的原点上。
//        winner1.verticalAlignmentMode = .bottom // 放置文本，使文本的底部位于节点的原点上。
        
 //       winner1.text = "baseline"
 //       mainScene.addChild(winner1)
        ///
        /// 3.3 文本在节点内的水平位置。(https://developer.apple.com/documentation/spritekit/sklabelnode/1519711-horizontalalignmentmode)
 //       let winner2 = SKLabelNode(fontNamed: "Chalkduster")
//        winner2.horizontalAlignmentMode = .left // 放置文本，以使文本的左侧位于节点的原点上。
//        winner2.horizontalAlignmentMode = .center // 将文本水平居中于节点的原点上。
//        winner2.horizontalAlignmentMode = .right // 放置文本，以使文本的右侧位于节点的原点上。
 //       winner2.text = "left"
 //       mainScene.addChild(winner2)
        ///
        
        // 4 定义标签的换行行为 配置这些属性以控制换行行为
        /// 4.1 宽度（以屏幕点为单位），之后应应用换行模式。（https://developer.apple.com/documentation/spritekit/sklabelnode/2865814-preferredmaxlayoutwidth）
        /// 默认值为0，这意味着将不应用换行模式。
//         let winner = SKLabelNode(fontNamed: "Chalkduster")
//          winner.preferredMaxLayoutWidth = 10
//        winner.text = "You Win！"
//        mainScene.addChild(winner)
        ///
    
        /// 4.2 确定多行的换行模式。（https://developer.apple.com/documentation/spritekit/sklabelnode/2865818-linebreakmode）
//        let winner = SKLabelNode(fontNamed: "Chalkduster")
//        winner.lineBreakMode = .byCharWrapping
//        winner.text = "You Win!"
//        mainScene.addChild(winner)
        
        /// 4.3 确定要绘制的线数。默认值为1（一行）。
        /// 值0解释为行数不受限制。
        /// 如果文本的高度达到行数，则将使用换行模式将文本截断。(https://developer.apple.com/documentation/spritekit/sklabelnode/2865815-numberoflines)
//        let winner = SKLabelNode(fontNamed: "Chalkduster")
//        winner.lineBreakMode = .byClipping
//        winner.text = "You Win!"
//        winner.numberOfLines = 2
//        mainScene.addChild(winner)
        ///
    
        /// 5. 给标签着色
        /// 5.1 可以用于动画的字体颜色的替代方法。(https://developer.apple.com/documentation/spritekit/sklabelnode/1519938-color)
//        let winner = SKLabelNode(fontNamed: "Chalkduster")
//        winner.color = SKColor.blue
//        winner.text = "You Win!"
//        mainScene.addChild(winner)
        ///
        
        // 6. 一个浮点值，描述颜色如何与字体颜色混合。(https://developer.apple.com/documentation/spritekit/sklabelnode/1519724-colorblendfactor)
        // 该值必须是介于0.0和1.0之间（含）的数字。默认值（）表示color属性将被忽略，
        // 标签的字体颜色应保持不变。对于大于的值，将字体颜色与混合颜色混合，最大值为1.0则确定字体颜色为混合颜色的100%
//        let winner = SKLabelNode(fontNamed: "Chalkduster")
//        winner.colorBlendFactor = 0.8
//        winner.text = "You Win!"
//        mainScene.addChild(winner)
        
        // 7 . 配置Alpha混合
        // 更改标签使用Alpha值（例如加法混合）的方式，导致标签比以前更亮。
        // 混合模式用于将标签绘制到父级的帧缓冲区中。(https://developer.apple.com/documentation/spritekit/sklabelnode/1519598-blendmode)
        let winner = SKLabelNode(text: "You Win!")//SKLabelNode(fontNamed: "Chalkduster")
        winner.blendMode = .add
        mainScene.addChild(winner)
    }
    
    // MARK : - 展示视频元素 (https://developer.apple.com/documentation/spritekit/skvideonode)
    func showVideoNode() {
        let videNode = SKVideoNode(fileNamed: "5b4d58fade11d.mp4")
        videNode.position = CGPoint(x: sceneView.frame.minX, y: sceneView.frame.minY)
        videNode.size = CGSize(width: 200, height: 100)
        mainScene.addChild(videNode)
        videNode.play()
        
       // 1. 通过添加视频节点在场景中播放视频。(https://developer.apple.com/documentation/spritekit/skvideonode/adding_a_video_to_a_scene)
        /// 视频节点仅提供该类可用功能的子集。以下是视频节点的相关限制
        /// 1.1 视频节点始终按比例缩放。
        /// 1.2 视频节点无法着色。但是，可以将其作为的子级添加，以添加用于色彩处理和其他效果的Core Image滤镜。SKEffectNode
        /// 1.3 视频节点始终使用Alpha混合模式。
        /// 1.4 视频节点不能使用自定义着色器或照明。
        /// 创建视频节点后，其size属性将初始化为视频内容的基本大小，但是您可以更改它。视频内容将自动拉伸到新的大小。与Sprite节点一样，该属性定义相对于节点位置显示内容的位置。anchorPoint
    }
    
    // Mark: - 添加图块
    
    func showPicTextureNode() {
        // 图像的二维数组。(https://developer.apple.com/documentation/spritekit/sktilemapnode)
        // SKTileMapNode可以在任何大小的网格中布置预定义的图块。通常，与在代码中配置平铺图相比，您可以在Xcode的SpriteKit场景编辑器中配置9切片图像（平铺组），并提前绘制平铺图的外观。
        // 与Sprite节点一样，您可以使用不同的混合模式对平铺贴图进行分层，也可以使用动作和物理方法对其进行控制，
        // 例如，以实现视差滚动。渲染后的图块地图可以使用进行后期处理，SKShader以添加效果，例如运动模糊或大气透视。
        // 1. 以编程方式创建平铺地图 (https://developer.apple.com/documentation/spritekit/sktilemapnode/creating_a_tile_map_programmatically)
        /// 1.1 使用提供的带有指定列数和行数的图块集创建和初始化图块地图节点。
        let tileGroupRule = SKTileGroupRule()
        let group = SKTileGroup(rules: [tileGroupRule])
        let tileSet = SKTileSet(tileGroups: [group])
        let tileMapNode = SKTileMapNode(tileSet: tileSet, columns: 4, rows: 4, tileSize: CGSize(width: 40, height: 40))
        mainScene.addChild(tileMapNode)
        
        
        ///1.2使用提供的带有指定列数和行数的图块集创建和初始化图块地图节点。(https://developer.apple.com/documentation/spritekit/sktilemapnode/creating_a_tile_map_programmatically)
        let tileSet2 = SKTileSet(named: "")!
        let texture = SKTexture(imageNamed: "")
        let tileDefinition = SKTileDefinition(texture: texture)
        let tileGroup = SKTileGroup(tileDefinition: tileDefinition)
        let tileMapNodewithTileGroup = SKTileMapNode(tileSet: tileSet2,
                                                     columns: 4,
                                                     rows: 4,
                                                     tileSize: CGSize(width: 40, height: 40),
                                                     fillWith: tileGroup)
        mainScene.addChild(tileMapNodewithTileGroup)
        
        /// 1.3  使用提供的具有指定列数和行数的平铺集创建和初始化平铺映射节点。对于网格集类型，
        /// 节点的总体大小(以点为单位)将为numberOfColumns * tileSize 为 宽 （width) 和 numberofrows * tileSize的高度为高(height)。
        let tileSet3 = SKTileSet(named: "")!
        let texture3 = SKTexture(imageNamed: "")
        let tileDefinition3 = SKTileDefinition(texture: texture3)
        let tileGroup3 = SKTileGroup(tileDefinition: tileDefinition3)
        let tileMapNodeWithGrid = SKTileMapNode(tileSet: tileSet3,
                                                columns: 4,
                                                rows: 4,
                                                tileSize: CGSize(width: 40, height: 40),
                                                tileGroupLayout: [tileGroup3])
        mainScene.addChild(tileMapNodeWithGrid)
        /// 1.4 通过允许选择瓷砖来创建瓷砖地图节点(https://developer.apple.com/documentation/spritekit/sktilemapnode/1640698-tilemapnodes)
        ///
        // 2. 定义平铺地图的内容
        ///2.1以编程方式创建切片地图节点时，请指定切片地图是否使用场景编辑器之类的自动映射行为。(https://developer.apple.com/documentation/spritekit/sktilemapnode/1643604-enableautomapping)
         /// 与通过场景编辑器提前创建拼贴图相比，以编程方式创建拼贴图时可以使用此功能
        /// 将此值设置true为使用fill(with:)和功能时想要自动映射行为（等同于在场景编辑器中使用画笔）的情况。setTileGroup(_:andTileDefinition:forColumn:row:)
        /// 2.2 以编程方式创建图块地图节点时，此功能对指定的图块组执行填充操作。(https://developer.apple.com/documentation/spritekit/sktilemapnode/1643615-fill)
        ///
        /// 2.3  在指定的图块索引处设置图块组和图块定义。(https://developer.apple.com/documentation/spritekit/sktilemapnode/1690935-settilegroup)
        ///
        /// 2.4 将图块组设置为指定的图块索引。(https://developer.apple.com/documentation/spritekit/sktilemapnode/1643605-settilegroup)
        ///
    }
    
    // MARK: - 展示3D
    
    func show3DNode() {
        // 绘制为展平精灵的3D SceneKit内容。 (https://developer.apple.com/documentation/spritekit/sk3dnode)
        /// 使用SK3DNode对象将3D SceneKit内容合并到基于SpriteKit的游戏中。当SpriteKit渲染节点时，将对SceneKit场景进行动画处理并首先渲染。然后，将渲染的图像合成到SpriteKit场景中。使用该属性指定要渲染的SceneKit场景。scnScene
        // 1。 3D节点入门
        /// 1.1 通过使用3D节点在SpriteKit场景中绘制SceneKit内容。（https://developer.apple.com/documentation/spritekit/sk3dnode/displaying_3d_content_in_a_spritekit_scene）
        /// SpriteKit中呈现的SceneKit内容会自动分配一个摄影机，并且由于默认为，所以会被分配灯光。
        /// 这意味着您只需很少的代码即可将简单的3D图元添加到场景中。以下代码显示了如何创建一个包含圆环的简单场景并将其显示在SpriteKit场景中
        
        let scene:SCNScene = {
            let scnScene = SCNScene()
            let torusGeometry = SCNTorus(ringRadius: 10, pipeRadius: 3)
            let torusNode = SCNNode(geometry: torusGeometry)
            torusNode.eulerAngles = SCNVector3(CGFloat.pi / 2, 0, 0)
            scnScene.rootNode.addChildNode(torusNode)
            return scnScene
        }()
        let node = SK3DNode(viewportSize: CGSize(width: 200, height: 200))
        node.scnScene = scene
        mainScene.addChild(node)
        /// 1.2 初始化新的3D节点。(https://developer.apple.com/documentation/spritekit/sk3dnode/1519708-init)
        
        let threeNode = SK3DNode(viewportSize:CGSize(width:100,height:100))
        
        /// 1.3 告诉您何时初始化未归档的3D节点。(https://developer.apple.com/documentation/spritekit/sk3dnode/1519722-init)
        ///
        // 2. 配置3D节点
        /// 2.1 节点渲染的图像的大小。(https://developer.apple.com/documentation/spritekit/sk3dnode/1520078-viewportsize)
        ///
        /// 2.2 要渲染的SceneKit场景。(https://developer.apple.com/documentation/spritekit/sk3dnode/1519834-scnscene)
        ///
        /// 2.3 渲染场景时从中查看场景内容的Scene Kit节点。(https://developer.apple.com/documentation/spritekit/sk3dnode/1519786-pointofview)
        /// 使用SCNNode将SCNCamera实例分配给其camera属性的对象来查看场景。
        /// 这个SceneKit节点提供虚拟相机的位置和方向，相机对象提供渲染参数，例如视野和焦点。观察方向沿SceneKit节点的局部坐标空间的负z轴。
        ///
        /// 2.4 一个布尔值，该值确定Scene Kit是否自动将灯光添加到场景。(https://developer.apple.com/documentation/spritekit/sk3dnode/1519676-autoenablesdefaultlighting)
        /// 如果此属性的值为true（默认值），则在渲染不包含光源或仅包含环境光源的场景时，
        /// SceneKit会自动添加和放置全向光源。如果将值更改为false，则SceneKit用于渲染场景的唯一光源是场景图中包含的光源。
        ///
        ///
        // 3. 在场景工具包中对3D节点的内容进行动画处理
        /// 3.1 一个布尔值，用于确定场景是否正在播放。(https://developer.apple.com/documentation/spritekit/sk3dnode/1520297-isplaying)
        ///
        /// 3.2 一个布尔值，该值确定在场景中的所有动画都播放完之后，Scene Kit是否重新启动场景时间。(https://developer.apple.com/documentation/spritekit/sk3dnode/1519549-loops)
        /// 如果此属性的值为true（默认值），则在播放与场景关联的所有动画之后，SceneKit将场景时间返回零，从而使这些动画重复。否则，在完成所有动画后，SceneKit将停止播放场景。
        ///
        /// 3.3 当前场景时间。(https://developer.apple.com/documentation/spritekit/sk3dnode/1519738-scenetime)
        /// 此时间戳确定正在运行的动画的行为，类似于视频播放器应用程序中的播放头时间如何确定要显示电影的哪一帧。它仅适用于属性为的动画，包括使用选项从场景源加载的动画。
        /// 当您要直接控制（或允许用户直接控制）动画的播放时，请将该属性与上述动画选项一起使用。
        ///
        // 4. 投射点并执行命中测试
         /// 4.1 在Scene Kit场景中搜索与渲染图像中的点相对应的对象。(https://developer.apple.com/documentation/spritekit/sk3dnode/1519782-hittest)
        /// SpriteKit节点的2D视口坐标空间中的点可以引用3D SceneKit坐标空间中沿线段的任何点。命中测试是查找沿此线段定位的场景元素的过程。例如，您可以使用此方法查找与触摸事件对应的几何。
        ///
        /// 4.2 将一个点从SceneKit场景的3D世界坐标系投影到SpriteKit节点的2D视口坐标系。 (https://developer.apple.com/documentation/spritekit/sk3dnode/1520400-projectpoint)
        ///
        /// 4.3 将SpriteKit节点的2D视口坐标系中的点取消投影到SceneKit场景的3D世界坐标系中。（https://developer.apple.com/documentation/spritekit/sk3dnode/1520024-unprojectpoint）
        
    }
}

