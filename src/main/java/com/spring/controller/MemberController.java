package com.spring.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.MemberVO;
import com.spring.service.MemberService;

import lombok.extern.log4j.Log4j;
@Log4j
@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	@Autowired
	private MemberService memberservice;
	@Autowired
    private JavaMailSender mailSender;
	
	@GetMapping(value = "join")
	public void memberjoin() throws Exception{
		log.info("회원가입 입장");
		
	}
	@GetMapping(value = "login")
	public void memberlogin() throws Exception{
		log.info("로그인 입장");
		
	}
	
	//회원가입
		@PostMapping(value="join")
		public String joinPOST(MemberVO member) throws Exception{
			
			log.info("join 진입");
			
			// 회원가입 서비스 실행
			memberservice.memberJoin(member);
			
			log.info("join Service 성공");
			
			return "redirect:/main";
			
		}
	
	
		/* 이메일 인증 */
		@GetMapping(value = "mailSend")
	    @ResponseBody
	    public String  mailCheckGET(String mail) throws Exception{
	        
	        /* 뷰(View)로부터 넘어온 데이터 확인 */
	        log.info("이메일 데이터 전송 확인");
	        log.info("인증번호 : " + mail);
	        /* 인증번호(난수) 생성 */
	        int leftLimit = 48; // numeral '0'
            int rightLimit = 122; // letter 'z'
            int length = 6;
            Random random = new Random();
            String checkNum = random.ints(leftLimit, rightLimit + 1)
                                           .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
                                           .limit(length)
                                           .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                                           .toString();
            log.info("난수: " + checkNum); 
            

            /* 이메일 보내기 */
            String setFrom = "#@naver.com";
            String toMail = mail;
            String title = "회원가입 인증 이메일 입니다.";
            String content = 
                    "홈페이지를 방문해주셔서 감사합니다." +
                    "<br><br>" + 
                    "인증 번호는 " + checkNum + "입니다." + 
                    "<br>" + 
                    "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	        
            
            try {
                
                MimeMessage message = mailSender.createMimeMessage();
                MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
                helper.setFrom(setFrom);
                helper.setTo(toMail);
                helper.setSubject(title);
                helper.setText(content,true);
                mailSender.send(message);
                
            }catch(Exception e) {
                e.printStackTrace();
            }
     
            String num = checkNum;
            return num;
	    }
		 /* 로그인 */
		@PostMapping(value="login")
	    public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
			log.info("post login 입장");
			 HttpSession session = request.getSession();
			 MemberVO vo = memberservice.memberLogin(member);
			 if(vo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
		            
		            int result = 0;
		            rttr.addFlashAttribute("result", result);
		            return "redirect:/member/login";
		            
		        }
		        
		        session.setAttribute("member", vo);             // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
		        
		        return "redirect:/main";
	        
	        
	    }
		/* 비동기방식 로그아웃 메서드 */
		@PostMapping(value="logout")
	    @ResponseBody
	    public void logoutPOST(HttpServletRequest request) throws Exception{
	        
	        log.info("비동기 로그아웃 메서드 진입");
	        
	        HttpSession session = request.getSession();
	        
	        session.invalidate();
	        
	    }
	 

       
	
}
