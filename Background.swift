import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    let text: Text
    let rectText: Text
    let gridText: Text
    let wallText: Text
    let pyramidText: Text
    let skySign: Text
    let skyText: Text
    let skyLine1: Text
    let skyLine2: Text
    let skyLine3: Text
    let skyLineText: Text
    let rectangle: Rectangle
    let rectangle1: Rectangle
    var gridRect: Rectangle = Rectangle(rect:Rect(topLeft:Point(x:50, y:150), size:Size(width:50, height:50)), fillMode:.stroke)
    var wallRect: Rectangle = Rectangle(rect:Rect(topLeft:Point(x:50, y:300), size:Size(width:100, height:50)), fillMode:.stroke)
    let mortarRect: Rectangle = Rectangle(rect:Rect(topLeft:Point(x:50, y:400), size:Size(width:550, height:250)), fillMode:.stroke)
    var pyramidRect: Rectangle = Rectangle(rect:Rect(topLeft:Point(x:600, y:300), size:Size(width:50, height:25)), fillMode:.stroke)
    let skyscraperRect: Rectangle
    let signStem: Rectangle = Rectangle(rect:Rect(topLeft:Point(x:812, y:350), size:Size(width:3, height:50)), fillMode:.stroke)
    let signBoard: Rectangle = Rectangle(rect:Rect(topLeft:Point(x:750, y:300), size:Size(width:125, height:50)), fillMode:.stroke)
    let sky1: Rectangle = Rectangle(rect:Rect(topLeft:Point(x:1000, y:425), size:Size(width:125, height:275)), fillMode:.stroke)
    let sky2: Rectangle = Rectangle(rect:Rect(topLeft:Point(x:1155, y:525), size:Size(width:125, height:175)), fillMode:.stroke)
    let sky3: Rectangle = Rectangle(rect:Rect(topLeft:Point(x:1000, y:825), size:Size(width:125, height:250)), fillMode:.stroke)

    init() {
        // Initialize Objects
        text = Text(location:Point(x:50, y:50), text:"H")
        text.font = "30pt Arial"
        let rect = Rect(topLeft:Point(x:20, y:10), size:Size(width:300, height:50))
        rectangle = Rectangle(rect:rect, fillMode:.stroke)
        rectText = Text(location:Point(x:30, y:125), text:"1:")
        rectText.font = "15pt Arial"
        gridText = Text(location:Point(x:30, y:200), text:"2:")
        gridText.font = "15pt Arial"
        wallText = Text(location:Point(x:30, y:400), text:"3:")
        wallText.font = "15pt Arial"
        pyramidText = Text(location:Point(x:580, y:200), text:"4:")
        pyramidText.font = "15pt Arial"

        let rect1 = Rect(topLeft:Point(x:50, y:125), size:Size(width:100,height:50))
        rectangle1 = Rectangle(rect:rect1, fillMode:.stroke)

        let skyRect = Rect(topLeft: Point(x:750, y:400), size:Size(width:125, height:300))
        skyscraperRect = Rectangle(rect:skyRect, fillMode:.stroke)

        skyText = Text(location:Point(x:730, y:400), text:"5:")
        skyText.font = "15th Arial"

        skyLineText = Text(location:Point(x:980, y:425), text:"6:")
        skyLineText.font = "15th Arial"

        skySign = Text(location:Point(x:750, y:325), text:"Shiraz Khan")
        skySign.font = "15pt Arial"

        skyLine1 = Text(location:Point(x:1000, y:625), text:"Shiraz Khan")
        skyLine1.font = "15pt Arial"
        skyLine2 = Text(location:Point(x:1155, y:625), text:"Shiraz Khan")
        skyLine2.font = "15pt Arial"

        skyLine3 = Text(location:Point(x:1000, y:925), text:"Shiraz Khan")
        skyLine3.font = "15pt Arial"

        // Using a meaningul name can be helpful for debugging
        super.init(name:"Background")
    }
    override func setup(canvasSize:Size, canvas:Canvas){
        var x = 50
        var y = 200
        for _ in (1 ... 3){
            for _ in (1 ... 3){
                let grid = Rect(topLeft:Point(x:x, y:y), size:Size(width:50, height:50))
                gridRect = Rectangle(rect:grid, fillMode:.stroke)
                x += 50
                canvas.render(gridRect)
            }
            x = 50
            y += 50
        }
        x = 50
        var x1 = 100
        y = 400
        for a in (1 ... 5){
            for _ in (1 ... 5){
                if(a % 2 == 0){
                    let wall = Rect(topLeft:Point(x:x, y:y), size:Size(width:100, height:50))
                    wallRect = Rectangle(rect:wall, fillMode:.stroke)
                    x += 100
                    canvas.render(wallRect)
                }
                else {
                    let wall = Rect(topLeft:Point(x:x1, y:y), size:Size(width:100, height:50))
                    wallRect = Rectangle(rect:wall, fillMode:.stroke)
                    x1 += 100
                    canvas.render(wallRect)
                }

            }
            x = 50
            x1 = 100
            y += 50
        }
        var x2 = 600
        var y2 = 200
        var brickNum = 7
        for b in (1 ... 7){
            for _ in (1 ... brickNum){
                let pyramid = Rect(topLeft:Point(x:x2, y:y2), size:Size(width:50, height:25))
                pyramidRect = Rectangle(rect:pyramid, fillMode:.stroke)
                x2 += 50
                canvas.render(pyramidRect)
            }
            brickNum -= 1
            x2 = 600 + (25 * b)
            y2 -= 25
        }

        canvas.render(text, gridText, rectText, wallText, pyramidText, skyText, skyLineText, skySign, skyLine1, skyLine2, skyLine3, rectangle, rectangle1, gridRect, wallRect, mortarRect, pyramidRect, skyscraperRect, signStem, signBoard, sky1, sky2, sky3)
    }
}

