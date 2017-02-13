extension Int {
    func map(from domain: CountableClosedRange<Int>, to codomain: CountableClosedRange<Int>) -> Int {
        let outRange = codomain.max()! - codomain.min()!
        let inRange = domain.max()! - domain.min()!
        return (((self - domain.min()!) * outRange) / inRange) + codomain.min()!
    }
}

