#import <CoreBluetooth/CoreBluetooth.h>

class ICallback;

@interface Bluetooth : NSObject<CBCentralManagerDelegate>
@property (nonatomic, strong) CBCentralManager *centralManager;
@property ICallback *controller;
@property (nonatomic, strong) NSDictionary *centralOptions;
- (id)initWithController:(ICallback *)controller;
- (void)start;
- (void)stop;
@end