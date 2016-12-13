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
苹果提出的更加有效的利用多核CPU的技术，线程自动管理如：创建线程、任务调度、销毁线程等，使用更加方便和灵活。<br>

#### 简单使用 ####
同步及异步任务：<br>
穿行及并行：<br>

	// dispatch_get_main_queue & dispatch_get_global_queue
	// oc
	 -(void) clickGCD {
		NSLog(@"执行GCD");
		dispatch_async(dispatch_get_global_queue(0,0),^{
			// 执行耗时任务(代码忽略)
			NSLog(@"start task 1");
			dispatch_async(dispatch_get_main_queue(),^{
				// 回到主线程刷新UI
				NSLog(@"刷新UI");
			})
		})
	}

![](http://i.imgur.com/5EyZgTr.png)

存储数据库及同步图片都可以采取此种方式。

    // dispatch_get_global_queue是一个全局并发的queue

	dispatch_async(dispatch_get_global_queue(0,0),^{
			NSLog(@"start task 1");
			[NSThread sleepForTimeInterval:2];
			NSLog(@"end task 1");
	});

	dispatch_async(dispatch_get_global_queue(0,0),^{
			NSLog(@"start task 2");
			[NSThread sleepForTimeInterval:2];
			NSLog(@"end task 2");
	});

	dispatch_async(dispatch_get_global_queue(0,0),^{
			NSLog(@"start task 3");
			[NSThread sleepForTimeInterval:2];
			NSLog(@"end task 3");
	});

![](http://i.imgur.com/yT9FSnB.png)

	// 设置线程优先级
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW,0),^{
			NSLog(@"start task 1");
			[NSThread sleepForTimeInterval:2];
			NSLog(@"end task 1");
	});

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGHT,0),^{
			NSLog(@"start task 1");
			[NSThread sleepForTimeInterval:2];
			NSLog(@"end task 1");
	});

![](http://i.imgur.com/8xJ9UIJ.png)

如果保证执行顺序，需要使用串行执行。
	
	// 自定义queue
	// DISPATCH_QUEUE_SERIAL == NULL
	dispatch_queue_t queue = dispatch_queue_create("com.test.gcd.queue",NULL);
	dipatch_async(queue,^{
		NSLog(@"start task 1");
		[NSThread sleepForTimeInterval:2];
		NSLog(@"end task 1");
	});

	dipatch_async(queue,^{
		NSLog(@"start task 2");
		[NSThread sleepForTimeInterval:2];
		NSLog(@"end task 2");
	});

	dipatch_async(queue,^{
		NSLog(@"start task 3");
		[NSThread sleepForTimeInterval:2];
		NSLog(@"end task 3");
	});

线程ID相同即上述代码单线程执行3个任务，没有实现多线程执行条件。
![](http://i.imgur.com/jmDvSGR.png)
	
	// 上段代码创建线程更换参数 DISPATCH_QUEUE_CONCURRENT
	dispatch_queue_t queue = dispatch_queue_create("com.test.gcd.queue",DISPATCH_QUEUE_CONCURRENT);


![](http://i.imgur.com/0W4Dka2.png)
		
线程ID不同即上述代码3个线程分别执行3个任务。

#### GCD_Group ####
多个任务异步处理的时候,有的时候需要告诉程序所有的任务已经执行完毕，当得知所有任务执行完成后会调用回调函数执行其他任务。
	
	// 创建并行queue
	dispatch_queue_t queue = dispatch_queue_t queue = dispatch_queue_create("com.test.gcd.group",DISPATCH_QUEUE_CONCURRENT);
	
	dispatch_group_t group = dispatch_group_create();
	 
	dispatch_group_async(group,queue, ^{
		NSLog(@"start task 1");
		[NSThread sleepForTimeInterval:2];
		NSLog(@"end task 1");
	});

	dispatch_group_async(group,queue, ^{
		NSLog(@"start task 2");
		[NSThread sleepForTimeInterval:2];
		NSLog(@"end task 2");
	});

	dispatch_group_async(group,queue, ^{
		NSLog(@"start task 3");
		[NSThread sleepForTimeInterval:2];
		NSLog(@"end task 3");
	});
	
	dispatch_group_notify(group,queue,^{
		NSLog(@"All tasks over");
	});
	
	// 回到主线程执行回调
	dispatch_group_notify(group,queue,^{
		NSLog(@"All tasks over");
		dispatch_async(			NSLog(@"回到主线程刷新UI");
		});
	});


![](http://i.imgur.com/hyN5hVk.png)

回调最后一个线程task3所对应的线程，没有单独开辟一个线程去执行回调任务，如果希望回到主线程执行调用回到主线程所对应的方法。
	
	// 异步请求 dispatch_group_enter 及 dipatch_group_leave 同时出现
	dispatch_group_t group = dispatch_group_create();
	dispatch_group_enter(group);
	[self sendRequest:^{
		NSLog(@"request done!")
		dipatch_group_leave(group)
	}];

#### GCD 单例模式及延迟执行 ####
	
	 + (instancetype) instance{
		 static dispatch_once_t onceToken;
		 static TestSingle *ins = nil;
		 dispatch_once(&onceToken,^{
			
		 })
	 } 

单例模式执行完之后，如果不销毁一直会存在会内存中被
### NSOperation ###


## 线程锁 ## 

	