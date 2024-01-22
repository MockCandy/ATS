package jobja.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import jobja.mypage.member.vo.MemberVO;



public class CustomUser extends User{
	
	private MemberVO memberVO;

	public CustomUser(String username, String password,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(MemberVO memberVO) {
		super(memberVO.getMemId(), memberVO.getMemPass(),
				memberVO.getMemberAuthVOList().stream()
				.map(memberAuthVO-> new SimpleGrantedAuthority(memberAuthVO.getRole()))
				.collect(Collectors.toList())
				);
		this.memberVO = memberVO;
	}
	public MemberVO getMemberVO(){
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	@Override
	public String toString() {
		return "CustomUser [memberVO=" + memberVO + "]";
	}
	
}
