package jobja.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import jobja.mypage.member.mapper.MemberMapper;
import jobja.mypage.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.info("ㅇㅇㅇㅇㅇ?");
		
		MemberVO memberVO = this.memberMapper.detail(username);
		log.info("loadUserByUsername -> memberVO : " +memberVO);
		log.info("loadUserByUsername -> memberVO : " +memberVO.getMemId());
		log.info("loadUserByUsername -> getMemPass : " +memberVO.getMemPass());
		
		return memberVO==null ? null : new CustomUser(memberVO);
	}
	
	
}
