package com.spring.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.domain.CateVO;
import com.spring.domain.Criteria;
import com.spring.domain.ImageVO;
import com.spring.domain.PageMakerVO;
import com.spring.domain.ProductVO;
import com.spring.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/admin/*")
@Log4j
public class AdminController {
	@Autowired
	private ProductService service;
	
	@GetMapping(value = "main")
	public void main() throws Exception{
		log.info("관리자메인함수");
	}
	
	//상품등록 첫화면
	@GetMapping(value = "produinsert")
	public void produinsert(Model model) throws Exception{
		log.info("상품등록함수");
		
		List<CateVO> list = service.cateList(); //카테고리 객체를 리스트타입 변수에 초기화
		ObjectMapper objm = new ObjectMapper(); //json으로 보내기 위해 ObjectMapper 생성
		String cateList = objm.writeValueAsString(list); // cateList 변수 선언하고 초기화
		model.addAttribute("cateList", cateList); //뷰로 보냄
	}
	
	
	//상품리스트 첫화면
	@GetMapping(value = "produList")
	public void produList(Criteria cri, Model model) throws Exception{
		log.info("상품리스트함수");
		/* 상품 리스트 데이터 */
		List<ProductVO> list = service.productList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageMakerVO(cri, service.totalList(cri)));
	}
	

	 /* 상품 등록 */
		@PostMapping(value ="produinsert")
		public String goodsEnrollPOST(ProductVO vo, RedirectAttributes rttr) {
			
			log.info("goodsEnrollPOST......" + vo);
			
			service.productinsert(vo); //상품등록
			
			rttr.addFlashAttribute("result", vo.getP_name()); //뷰에 상품이름을 넘겨줌
			
			return "redirect:/admin/produList"; //넘길 정보갖고 상품목록화면으로 리다이렉트
		}	
	    
		/* 상품 조회 페이지 */
		@GetMapping({"productDetail","productModify"})
		public void goodsGetInfoGET(int product_num, Criteria cri, Model model) throws JsonProcessingException {
			
			log.info("goodsGetInfo()........." + product_num); //카테고리 정보를 json형태로 뷰한테 넘겨줌
			List<CateVO> list = service.cateList();
			ObjectMapper objm = new ObjectMapper();
			String cateList = objm.writeValueAsString(list);
			model.addAttribute("cateList", cateList);
			
			/* 목록 페이지 조건 정보 */
			model.addAttribute("cri", cri);
			
			/* 조회 페이지 정보 */
			model.addAttribute("detail", service.productDetail(product_num)); //이미지 정보는 안담긴체 넘어감
			
		}
		
		/* 상품 정보 수정 */
		@PostMapping("productModify")
		public String goodsModifyPOST(ProductVO vo) {
			
			log.info("goodsModifyPOST.........." + vo);
			
			service.proModify(vo);
			
			return "redirect:/admin/produList";		
			
		}
		
		/* 상품 정보 삭제 */
		@PostMapping("proDelete")
		public String goodsDeletePOST(int product_num, RedirectAttributes rttr) {
			
			log.info("goodsDeletePOST..........");
			
			int result = service.proDelete(product_num); 
			
			rttr.addFlashAttribute("delete_result", result);
			
			return "redirect:/admin/produList";
			
		}
		
		/* 첨부 파일 업로드 */
		@PostMapping(value="uploadfile", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		public ResponseEntity<List<ImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) 
	            {
			
			log.info("uploadAjaxActionPOST..........");
			
			String uploadFolder = "C:\\fileupload"; //지정한 저장경로
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //날짜형식으로 저장하는 객체 생성
			Date date = new Date(); //현재 날짜를 나타내는 객체 생성
			
			String str = sdf.format(date); //현재 날짜 형식으로 
			String datePath = str.replace("-", File.separator);//-를 이용해 날짜를 나눔
			
			File uploadPath = new File(uploadFolder, datePath); //파일이 업로드 되는 형식
			if(uploadPath.exists() == false) { //폴더가 존재하지 않으면 폴더 생성
			uploadPath.mkdirs();
			
			}
			/* 이미저 정보 담는 객체 */
			List<ImageVO> list = new ArrayList(); //ImageVO타입 변수 생성
			
			 for(MultipartFile multipartFile : uploadFile) { //전달받은 파일 인덱스만큼 for문을 돌린다
					
				 ImageVO vo = new ImageVO();
				 
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();	//파일 이름 저장
			vo.setUploadFileName(uploadFileName);
			System.out.println(uploadFileName);
			/* uuid 적용 파일 이름(중복방지) */
			String uuid = UUID.randomUUID().toString();
			System.out.println(uuid);
			uploadFileName = uuid + "_" + uploadFileName;
			
			vo.setUploadPath(datePath);
			vo.setUuid(uuid);
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile); //transferTo이용해 파일 저장
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName); //썸네일 변수 파일 생성자롤 생성
				//썸네일 이미지 크기
				BufferedImage bo_image = ImageIO.read(saveFile); 
				BufferedImage bt_image = new BufferedImage(300, 500, BufferedImage.TYPE_3BYTE_BGR); 
								
				Graphics2D graphic = bt_image.createGraphics(); 
				
				graphic.drawImage(bo_image, 0, 0,300,500, null); 
					
				ImageIO.write(bt_image, "jpg", thumbnailFile);
	 
				
				
			} catch (Exception e) {
				e.printStackTrace();
			} 
		list.add(vo);
			 }//for
			 
			 ResponseEntity<List<ImageVO>> result = new ResponseEntity<List<ImageVO>>(list, HttpStatus.OK);
			return result;
		}//end
	
		/* 이미지 파일 삭제 */
		@PostMapping("deleteFile")
		public ResponseEntity<String> deleteFile(String fileName){
			
			log.info("deleteFile........" + fileName);
			File file = null; //파일클레스의 delete()메소드를 사용해서 삭제하기위해 인스턴스화
			try {
				file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8")); //디코딩으로 경로을 알수 있게
				
				file.delete(); //파일삭제
				/* 원본 파일 삭제 */
				String originFileName = file.getAbsolutePath().replace("s_", "");  
				//앞에 선언한 file변수를 가지고 문자열형식으로 바꾸고 일반 사진형식으로 replace로 바꿈
				//log.info("originFileName : " + originFileName);
				
				file = new File(originFileName); //원본사진으로 초기화 해줌
				
				file.delete(); //원본 사진 삭제
				return new ResponseEntity<String>("success", HttpStatus.OK);	
				
			} catch (Exception e) {
				return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED); // 삭제 실패정보를 알리기 위해서
			}
			
			
		}
		
}
