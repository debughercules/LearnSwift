import Foundation

class vehicle{
    var vehicleType: String
    var Name: String?
    
    public init(vehicleType: String, Name: String? = nil) {
        self.vehicleType = vehicleType
        self.Name = Name
    }
}

class FourWheeler {
    var modelNumber: String
    var isFourByFour: String
    
    public init(modelNumber: String, isFourByFour: String){
        self.modelNumber = modelNumber
        self.isFourByFour = isFourByFour
    }
}

class HondaCity: vehicle {
    public override init(vehicleType: String, Name: String?) {
        super.init(vehicleType: "car", Name: "MyHOnfa")
    }
}
