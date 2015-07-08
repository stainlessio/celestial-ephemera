#if !__has_feature(objc_arc)
#error "ARC is off!"
#endif

#include "osx/bluetooth.h"
#import "osx/bluetoothObjc.h"

class BluetoothWatcherImpl : public ICallback
{

public:
	BluetoothWatcherImpl(CallbackPtr callback)
	  : m_callback(callback)
	  , m_running(false)
	{
		m_bluetooth = [[Bluetooth alloc] initWithController:this];
	}

	~BluetoothWatcherImpl()
	{
		if (m_running) {
			stop();
		}
	}

	void start()
	{
		if (m_running) return;
		if (m_bluetooth) {
			[m_bluetooth start];
			m_running = true;
		}		
	}

	void stop()
	{
		if (!m_running) return;
		if (m_bluetooth) {
			[m_bluetooth stop];
			m_running = false;
		}
	}

private:
	CallbackPtr m_callback;
	Bluetooth *m_bluetooth;
	bool m_running;
};

BluetoothWatcher::BluetoothWatcher(CallbackPtr callback, bool autoStart /* = false */)
  : m_impl(new BluetoothWatcherImpl(callback))
{
	if (autoStart) {
		start();
	}

}

void BluetoothWatcher::start()
{
	m_impl->start();
}

void BluetoothWatcher::stop()
{
	m_impl->stop();
}

BluetoothWatcher::~BluetoothWatcher()
{
	if (m_impl) {
		delete m_impl;
	}
}