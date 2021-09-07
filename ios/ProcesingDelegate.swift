// Helpful interfaces and enums

import FaceTecSDK

protocol ProcessingDelegate: class {
    func onProcessingComplete(isSuccess: Bool, facetecSessionResult: FaceTecSessionResult?)
    func onProcessingComplete(isSuccess: Bool, facetecSessionResult: FaceTecSessionResult?, externalDatabaseRefID: String?, xUserAgent: String?)
    func onProcessingComplete(isSuccess: Bool, facetecSessionResult: FaceTecSessionResult?, facetecIDScanResult: FaceTecIDScanResult?)
}
