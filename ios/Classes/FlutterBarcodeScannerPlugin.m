#import "FlutterBarcodeScannerPlugin.h"
#import <minimal_barcode_scanner/minimal_barcode_scanner-Swift.h>

@implementation FlutterBarcodeScannerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterBarcodeScannerPlugin registerWithRegistrar:registrar];
}
@end
