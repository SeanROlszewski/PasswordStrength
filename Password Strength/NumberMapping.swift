extension Double {
    func map(from domainMin: Double, to domainMax: Double, within codomainMin: Double, and codomainMax: Double) -> Double {
        let outRange = codomainMax - codomainMin
        let inRange = domainMax - domainMin
        return (((self - domainMin) * outRange) / inRange) + codomainMin
    }
}

