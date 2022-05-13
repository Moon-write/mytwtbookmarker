package com.github.moon;

import java.security.MessageDigest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.github.user.model.vo.User;

@Component
@Aspect
public class PasswordEncAdvice {
	
	@Pointcut(value="execution(* com.github.user.model.service.UserService.*User(com.github.user.model.vo.User))") 
	//  리턴타입 상관없고 * kr~클래스의 *Member로끝나는 메소드 중 매개변수가 1개(Member객체)인 것 고르기
	public void encPointcut() {
		
	}
	
	@Before(value="encPointcut()") // encpointcut 수행전에 이거 수행해라
	public void encPassword(JoinPoint jp) {
		Object[] args = jp.getArgs(); // 매개변수 끌어오기 > 그런데 무조건 매개변수 단 하나뿐, Member객체뿐.
		User u = (User)args[0]; // 그래서 0번 인덱스 요소를 member타입으로 형변환 가능
		String beforePw = u.getUserPw();
		
		if(beforePw!=null) {
			try {
				String encPw = endData(beforePw);
				u.setUserPw(encPw);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			//단, 이렇게 암호화한 내용은 비밀번호 수정을 하면 또 평문화되어 돌이킬수없어지므로 마이페이지에서 쉽게 비번변경을해주지는말자				
		}
	}	
	
	public String endData(String data) throws Exception{
		// 데이터를 매개변수로 받고, 내부 로직을 통해 암호화를 하고 암호화한 결과를 리턴
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256"); // 암호화 알고리즘 중 SHA-256 알고리즘 사용
		// 매개변수로 받은 암호화 전 비밀번호를 byte 배열로 변환
		byte[] beforePw = data.getBytes();
		// byte 배열로 변환된 암호화 전 비밀번호를 SHA-256으로 암호화
		mDigest.update(beforePw);
		// 암호화된 pw를 byte배열로 추출
		byte[] encStr = mDigest.digest();
		//byte > 1byte로 정수 표현 > 2진수 8자리 > 표현할 수 있는 숫자갯수 2*8 > 256개 > -128 ~ 127까지가 유효범위
		// 0~255로 변환하여 사용 (16진수는 0~f로 표현)
		StringBuffer sb= new StringBuffer();
		for(int i=0;i<encStr.length;i++) {
			byte tmp = encStr[i];
			String tmpText = Integer.toString((tmp& 0xff)+0x100,16).substring(1); // 가운데 x를 *로썼던 내인생레전드 ㅋ
			sb.append(tmpText);
		}
		return sb.toString();
		// 단, 이거 쓸 땐 DB의 글자용량이 CHAR(64)여야함
	}
	

}
