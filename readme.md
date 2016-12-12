# IOS知识总结 #

## 1.线程 ##
1. pThread
2. NSThread
3. GCD
4. NSOperation

### pThread ###
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

### NSThread ###

	// oc
	// NSThread创建线程三种方法（三选一）

	// 1.通过alloc init的方式创建线程执行线程）
	NSLog(@"我在主线程中执行！");
	NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(runThread) object:nil];
	// 开始线程
	[thread1 start];
	
	// 2.通过detachNewThtreadSelecor 方式创建线程
	[NSThread detachNewThtreadSelecor:@selector(runThread) toTarget:self withObject:nil]; 

	// 3.通过performSelectorInBackground 方式创建线程
	[self performSelectorInBackground:@selector(runThread) withObject:nil];

	// 线程方法
	 -(void) runThread {
		NSLog(@"我在子线程中执行！");
		// 回到主线程执行
		[self performSelectOnMainThread:@selector(runMainThread) withObject:nil waitUntilDone:YES];
	 }
	
	// 主线程方法
	 -void runMainThread {
		NSLog(@"回到主线程执行！");
	 }

![](http://i.imgur.com/TZEEBwT.jpg)<br>

第一种方式需要调用线程对象的start方法执行线程而其他两种直接开启线程。

	// 第一种方法
	// 设置线程名称
	[thread1 setName:@"Name_Thread1"];
	// 获得线程name
	[NSThread currentThread].name;
	// 优先级(double)
	[thread1 setThreadPriority:0.5]

![](http://i.imgur.com/4gLrvpJ.jpg)


### GCD ###
### NSOperation ###


## 线程锁 ## 

	