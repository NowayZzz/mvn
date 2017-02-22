package com.common.db;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;


@Component
@Aspect
public class MultipleDataSourceAspectAdvice {
	
    @Around("execution(* com.rms.dao.*.*(..))")
    public Object doAround(ProceedingJoinPoint jp) throws Throwable {
    	
    	/*System.out.println("------------------------------------------------哎哟喂，终于进来了。");
    	Object mapper = jp.getTarget();
    	System.out.println("-------2---------"+jp.getSignature().getDeclaringType().getSimpleName());//√
    	System.out.println("-------4---------"+jp.getSignature().toString());//√
*/        
//		String interfaceName = jp.getSignature().getDeclaringType().getSimpleName();
    	MultipleDataSource.setDataSourceKey("dataSource");
        return jp.proceed();
    }
}


