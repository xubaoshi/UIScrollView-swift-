# IOS知识总结 #

## 1.线程 ##
1. pThread
2. NSThread
3. GCD
4. NSOperation

pThread
基于c语言框架，多平台
	
	// oc 
	pthread_t pthread;
	NSLog(@"我在主线程中执行！");
	phread_create(&pthread,NULL,run,NULL);  // 创建线程
	
	void *run(void *data){
		NSLog(@"我在子线程中执行！");
		return NULL;
	}

![](http://i.imgur.com/Wp0qGLG.png)<br>

从图中可以看出当前进程号及线程号。两个log方法在相同的进程中不同的线程下执行。

NSThread
GCD
NSOperation

	