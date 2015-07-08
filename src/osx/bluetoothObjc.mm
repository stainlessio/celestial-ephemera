#import "osx/bluetoothObjc.h"

@implementation Bluetooth

#pragma mark - CBCentralManagerDelegate

- (id)initWithController:(ICallback *)controller
{
	self = [super init];
	if (self) {
		_centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
		_centralOptions = [[NSDictionary alloc] initWithObjectsAndKeys:
			CBCentralManagerScanOptionAllowDuplicatesKey, YES,
		nil];
	}

	return self;
}

- (void)start
{
	NSLog(@"Starting Scanning");
	[_centralManager scanForPeripheralsWithServices:nil options:nil];
}

- (void)stop
{
	NSLog(@"Stopping Scanning");
	[_centralManager stopScan];
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
	NSData *data = [advertisementData objectForKey:CBAdvertisementDataManufacturerDataKey];
    if (data)
	{
		NSLog(@"Found device: %@", data);
	}
	NSString *name = [advertisementData objectForKey:CBAdvertisementDataLocalNameKey];
	if (name)
	{
		NSLog(@"Device is named: %@", name);
	} else {
		NSLog(@"Device did not send name");
	}
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    // Determine the state of the peripheral
    if ([central state] == CBCentralManagerStatePoweredOff) {
        NSLog(@"CoreBluetooth BLE hardware is powered off");
    }
    else if ([central state] == CBCentralManagerStatePoweredOn) {
        NSLog(@"CoreBluetooth BLE hardware is powered on and ready");
    }
    else if ([central state] == CBCentralManagerStateUnauthorized) {
        NSLog(@"CoreBluetooth BLE state is unauthorized");
    }
    else if ([central state] == CBCentralManagerStateUnknown) {
        NSLog(@"CoreBluetooth BLE state is unknown");
    }
    else if ([central state] == CBCentralManagerStateUnsupported) {
        NSLog(@"CoreBluetooth BLE hardware is unsupported on this platform");
    }
}

@end