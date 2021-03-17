import Foundation
import Theo

final class GraphBaseManager {
    private static var sharedGraphBaseManager: GraphBaseManager = {
        let instance = GraphBaseManager()
        return instance
     }()
    
    private init() {}
    
    class func shared() -> GraphBaseManager {
        return sharedGraphBaseManager
    }
    
    public func instantiateDatabase(connectionConfig: ConnectionConfig) {
        let instance = try? BoltClient(hostname: connectionConfig.host ?? "192.168.0.106", port: connectionConfig.port ??  7687, username: connectionConfig.username ?? "neo4j", password: connectionConfig.password ?? "neo4j", encrypted: true)
    }
    
    public func createNode() {
        
    }
}


extension GraphBaseManager: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
