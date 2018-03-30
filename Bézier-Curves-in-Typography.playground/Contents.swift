import Cocoa
import PlaygroundSupport


// To experience this playground, please open the Assistant Editor (⌥⌘,) and
// select this playground page's Live View.
//
// Bézier curves are parametric curves between two endpoints that can be linked
// together to form smooth paths that can be scaled indefinitely without a loss
// of detail.
//
// Although the idea of Bézier curves itself is a purely mathematical concept,
// we unknowingly consume them every day: Fonts define the outline of individual
// glyphs as a sequence of linked Bézier curves, allowing the glyphs to look
// smooth at all sizes. Vector graphics, such as SVG, also utilize Bézier curves
// to ensure they look great at all sizes. In contrast, when increasing the size
// of a rasterized image, one will quickly notice the loss of detail. When
// drawing content to the screen, everything needs to be rasterized eventually,
// but vector fonts and graphics perform this step at the very last, and not at
// the time they are designed.
//
// This playground allows you to get a feel for how Bézier curves work and how
// complex glyphs or icons can be built by linking multiple curves together. You
// can load up any `CGPath` you want and move its control points around to see
// how it affects the path.

do {
    // The character and font to be inspected. Also try:
    //  - ASCII characters
    //  - Greek characters, such as `"λ"`
    //  - Arabic characters, such as `"ض"`
    //  - Other fonts, such as `NSFont(name: "Zapfino", size: 12.0)!`
    let character = "任" as Character
    let font = NSFont.systemFont(ofSize: 12.0)

    // The path to be inspected. Also try:
    //  - `CGPath.ellipse(width: 10, height: 10)`
    //  - `CGPath.roundedRect(width: 10, height: 10, cornerRadius: 2)`
    //  - `CGPath.svg(named: "apple")!`
    //  - `CGPath.svg(named: "swift")!`
    //  - any path you would like to inspect, really!
    let path = CGPath.outline(of: character, font: font)

    // Configuration of the inspector view
    let width = round(NSScreen.main!.frame.width / 3)
    let height = round(NSScreen.main!.frame.height / 1.5)
    let frame = CGRect(x: 0, y: 0, width: width, height: height)
    let view = PathInspectorView(frame: frame, path: path)

    // Feel free to play around with these:
//    view.transform = CGAffineTransform.identity
//    view.strokeColor = NSColor.blue
//    view.fillColor = NSColor.red.withAlphaComponent(0.1)
//    view.fillRule = CGPathFillRule.winding
//    view.highlightColor = NSColor.red

    PlaygroundPage.current.liveView = view
}
