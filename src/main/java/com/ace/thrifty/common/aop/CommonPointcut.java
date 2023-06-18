package com.ace.thrifty.common.aop;

import org.aspectj.lang.annotation.Pointcut;

public class CommonPointcut {

	@Pointcut("execution(* com.ace.thrifty.member..*Imp*.*(..))")
	public void currentLoginPointcut() {}
}
