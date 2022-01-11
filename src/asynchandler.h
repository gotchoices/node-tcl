
#ifndef ASYNCHANDLER_H
#define ASYNCHANDLER_H

#include <napi.h>
#include <atomic>
#include <mutex>
#include <string>
#include <condition_variable>

class AsyncHandler : public Napi::AsyncWorker {
public:

	AsyncHandler( Napi::Function& callback );
	virtual ~ AsyncHandler();

	void notify( const std::string &err, const std::string &data );
	void Execute();
	void OnOK();

private:

	std::atomic< bool > _notify;

	std::mutex _notify_mutex;
	std::condition_variable _notify_cnd;

	std::string _data;

};

#endif /*! ASYNCHANDLER_H */
