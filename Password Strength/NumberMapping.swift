extension Double {
    func map(from xMin: Double, to xMax: Double, within yMin: Double, and yMax: Double) -> Double {
        let yRange = yMax - yMin
        let xRange = xMax - xMin
        return (((self - xMin) * yRange) / xRange) + yMin
    }
}
