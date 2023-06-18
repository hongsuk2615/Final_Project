package com.ace.thrifty.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	private int userNo;
	private String userName;
	private String nickName;
	private String gender;
	private String userId;
	private String userPwd;
	private String phone;
	private String email;
	private Date pwdUpdateDate;
	private String isBanned;
	private int reportCount;
	private String currentLogin;
	private Date joinDate;
	private int authority;
	private String status;
	private String loginMethod;
	private String todayLogin;
	
	private String originName;
	private String changeName;
	
}
