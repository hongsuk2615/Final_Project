package com.ace.thrifty.member.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ace.thrifty.member.model.service.MemberService;
import com.ace.thrifty.member.model.vo.KakaoOathToken;
import com.ace.thrifty.member.model.vo.KakaoUser;
import com.ace.thrifty.member.model.vo.Member;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/member")
@SessionAttributes({"loginUser"})
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/enroll")
	public String enroll() {
		
		return "member/enrollForm";
	}
	
	@ResponseBody
	@PostMapping("/enroll")
	public boolean insertMember(Member m) {
		System.out.println(m);
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
		
		System.out.println(encPwd);
		return memberService.insertMember(m) == 1 ? true : false;
	}
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String loginMember(Member m, Model model, HttpServletRequest request, RedirectAttributes ra) {
		System.out.println(m);
		String referer = request.getHeader("Referer");
		Member loginUser = memberService.loginMember(m);
		if( loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			ra.addFlashAttribute("alertMsg", "로그인 성공");
			model.addAttribute("loginUser", loginUser);
			
			if(loginUser.getAuthority() == 1) { //오늘 처음 로그인할 경우 LOGIN_TODAY 값 변경
				memberService.todayLogin(loginUser.getUserNo());
				return "redirect:" + referer;
			}else {
				return "redirect:/admin";
			}
			
		}else {
			ra.addFlashAttribute("alertMsg", "로그인 실패");
			return "redirect:" + referer;
		}
		
	}
	
	@GetMapping("/logout")
	public String logOut(@SessionAttribute("loginUser") Member loginUser, SessionStatus status) {
		
		memberService.currentLogOut(loginUser.getUserNo());
		status.setComplete();
		return "redirect:/";
	}
	
	@GetMapping("/validateId")
	@ResponseBody
	public boolean validateId(String userId) {
		return memberService.selectById(userId) == null;
	}
	
	@GetMapping("/validateEmail")
	@ResponseBody
	public boolean validateEmail(String email) {
		return memberService.selectByEmail(email) == null;
	}
	
	@GetMapping("/validateNickName")
	@ResponseBody
	public boolean validateNickName(String nickName) {
		return memberService.selectByNickName(nickName) == null;
	}
	
	@GetMapping("/kakaoLogin")
	public String kakaoLogin(String code, Model model, HttpServletRequest request, RedirectAttributes ra) {
		String referer = request.getHeader("Referer");
		//POST 방식으로 key, value데이터를 요청
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("grant_type","authorization_code");
		params.add("client_id","17596a7a342e703f12c332dec822a955");
//		params.add("redirect_uri", "http://localhost:8081/thrifty/member/kakaoLogin"); //localhost
		params.add("redirect_uri", "http://3.38.209.77/thrifty/member/kakaoLogin");
		params.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
					new HttpEntity<MultiValueMap<String,String>>(params, headers);
		
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, kakaoTokenRequest,String.class);
		
		ObjectMapper objectMapper = new ObjectMapper();
		KakaoOathToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), KakaoOathToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		System.out.println("토큰 : " + oauthToken.getAccess_token());
		
		
		RestTemplate rt2 = new RestTemplate();		
		
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		headers2.add("Authorization", "Bearer "+ oauthToken.getAccess_token());
		
		HttpEntity<MultiValueMap<String,String>> kakaoProfileRequest =
					new HttpEntity<>(headers2);
		
		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST, kakaoProfileRequest,String.class);
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoUser kakaoUser = null;
		try {
			kakaoUser = objectMapper2.readValue(response2.getBody(), KakaoUser.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		Member member = memberService.selectByKakaoId(kakaoUser.getKakao_account().getEmail()+"_"+kakaoUser.getId());
		if(member == null) {
			member = new Member();
			member.setUserId(kakaoUser.getKakao_account().getEmail()+"_"+kakaoUser.getId());
			member.setUserName(kakaoUser.getKakao_account().getProfile().getNickname());
			member.setNickName(kakaoUser.getKakao_account().getProfile().getNickname());
			member.setChangeName(kakaoUser.getKakao_account().getProfile().is_default_image()? null :kakaoUser.getKakao_account().getProfile().getProfile_image_url());
			member.setOriginName(kakaoUser.getKakao_account().getProfile().is_default_image()? null :kakaoUser.getKakao_account().getProfile().getProfile_image_url());
			
			
			member.setEmail(kakaoUser.getKakao_account().getEmail());
			member.setLoginMethod("K");
			member.setGender(kakaoUser.getKakao_account().getGender().equals("male")? "M" : kakaoUser.getKakao_account().getGender().equals("female")? "F" : "N");
			UUID uuid = UUID.randomUUID();
			String encPwd = bcryptPasswordEncoder.encode(uuid.toString());
			member.setUserPwd(encPwd);
			member.setPhone("카카오로그인유저");
			if(memberService.insertMember(member) > 0) {
				ra.addFlashAttribute("alertMsg", "로그인 성공");
				model.addAttribute("loginUser",member);
				memberService.todayLogin(member.getUserNo()); //오늘 처음 로그인할 경우 LOGIN_TODAY 값 변경
			}else {
				ra.addFlashAttribute("alertMsg", "로그인 실패");
			}
		}else {
			ra.addFlashAttribute("alertMsg", "로그인 성공");
			model.addAttribute("loginUser",member);
			if(member.getAuthority() == 1) { //오늘 처음 로그인할 경우 LOGIN_TODAY 값 변경
				memberService.todayLogin(member.getUserNo());
			}
		}
		System.out.println("아이디: " + kakaoUser.getId());
		System.out.println("이름: " + kakaoUser.getKakao_account().getProfile().getNickname());
		System.out.println("이메일: " + kakaoUser.getKakao_account().getEmail());
		System.out.println("프사 : " + kakaoUser.getKakao_account().getProfile().getProfile_image_url());
		System.out.println("성별 : " + kakaoUser.getKakao_account().getGender());
		
		return "redirect:/";
	}
	
	@GetMapping("/findId")
	@ResponseBody
	public String findId(Member member) {
		String id = memberService.findId(member);
		return id;
	}
	
	@GetMapping("/findPwd")
	@ResponseBody
	public String findPwd(Member member) {
		String result = memberService.findPwd(member);
		return result;
	}
	

}
