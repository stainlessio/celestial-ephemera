#pragma once

#include <memory>

class ICallback {

};

using CallbackPtr = ICallback*;

class BluetoothWatcherImpl;

class BluetoothWatcher {
public:
	BluetoothWatcher(CallbackPtr callback, bool autoStart = false);
	~BluetoothWatcher();

	void start();
	void stop();

protected:
	BluetoothWatcherImpl* m_impl;
};