import CoreVideo
import CoreGraphics

extension CGImage {
    func toPixelBuffer() -> CVPixelBuffer? {
        let attributes: [String: Any] = [
            kCVPixelBufferCGImageCompatibilityKey as String: true,
            kCVPixelBufferCGBitmapContextCompatibilityKey as String: true
        ]
        
        var pixelBuffer: CVPixelBuffer?
        
        let width = self.width
        let height = self.height
        
        let status = CVPixelBufferCreate(kCFAllocatorDefault,
                                         width,
                                         height,
                                         kCVPixelFormatType_32BGRA,
                                         attributes as CFDictionary,
                                         &pixelBuffer)
        
        guard let buffer = pixelBuffer, status == kCVReturnSuccess else {
            print("🟥 Error: No se pudo crear el pixelBuffer.")
            return nil
        }
        let pixelBufferWidth = CVPixelBufferGetWidth(buffer)
        let pixelBufferHeight = CVPixelBufferGetHeight(buffer)
        print("🟢 Dimensiones del pixelBuffer: \(pixelBufferWidth)x\(pixelBufferHeight)")
        
        CVPixelBufferLockBaseAddress(buffer, [])
        
        guard let context = CGContext(data: CVPixelBufferGetBaseAddress(buffer),
                                      width: width,
                                      height: height,
                                      bitsPerComponent: 8,
                                      bytesPerRow: CVPixelBufferGetBytesPerRow(buffer),
                                      space: CGColorSpaceCreateDeviceRGB(),
                                      bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue) else {
            print("🟥 Error al crear el contexto")
            CVPixelBufferUnlockBaseAddress(buffer, [])
            print("🟥 Error: No se pudo crear el contexto para el pixelBuffer.")
            return nil
        }
        
        context.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))
        
        CVPixelBufferUnlockBaseAddress(buffer, [])
        let baseAddress = CVPixelBufferGetBaseAddress(buffer)
        if baseAddress == nil {
            print("🟥 Error: No se pudo acceder a la base de la dirección de memoria del pixelBuffer")
        }else {
            print("🟢 Base address accesible.")
        }
        CVPixelBufferUnlockBaseAddress(buffer, [])
        return buffer
    }
}
