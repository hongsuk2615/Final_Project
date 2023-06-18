package com.ace.thrifty.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.ace.thrifty.member.model.vo.Member;

@Component
@Aspect
public class LoginAOP {
	
	@AfterReturning(pointcut = "CommonPointcut.currentLoginPointcut()", returning = "returnObj")
	public void returnValue(JoinPoint jp, Object returnObj) {
		System.out.println("안되나?");
		if(returnObj instanceof Member) {
			Member loginMember = (Member)returnObj;
			System.out.println("AOP"+loginMember);
		}
	}
	
//	 @Before("execution(* com.kh.spring.board..*Impl*.*(..))")
	@Before("testPointcut()")
	public void start() { // 서비스 수행 전에 실행되는 메서드(advice)
		System.out.println("========================================Service Start===========================================");
	}
	
	
//	 @After : PointCut에 지정된 메소드가 수행된 후, advice수행을 하라고 지시하는 어노테이션
//	 @After("execution(* com.kh.spring.board..*Impl*.*(..))")
	@After("testPointcut()")
	public void end() {
		System.out.println("========================================Service End===========================================");
	}
	
//	 @PointCut을 작성해 놓은 메소드
//	 -> PointCut의 패턴이 작성되는 부분에 testPointcut()메서드이름을 작성하면, PointCut에 정의한 패턴이 적용된다.
	@Pointcut("execution(*com.ace.thrifty.member..*Imp*.*(..))")
	public void testPointcut() {} // 내용작성x
}
