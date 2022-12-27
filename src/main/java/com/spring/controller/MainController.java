package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.spring.domain.Criteria;
import com.spring.domain.ImageVO;
import com.spring.domain.PageMakerVO;
import com.spring.domain.ProductVO;
import com.spring.service.ProductService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MainController {
	
	@Autowired
	private ProductService productService;

	@GetMapping(value = "/main")
	public void main(Model model,Criteria criteria) throws Exception {
		log.info("메인함수");
		List<ProductVO> list = productService.productList(criteria);
		log.info(list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		}else {
			model.addAttribute("listcheck", "empty");
		}
		
		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageMakerVO(criteria, productService.totalList(criteria)));
		
		
		
	}

	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName) {
		System.out.println(fileName);
		File file = new File("c:\\fileupload\\" + fileName);
		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 이미지 정보 반환  상품 디테일에서 json형태로 정보를 받고 json형태로 정보 반환(produces사용)*/
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE) //비동기방식으로 정보요청받음
	public ResponseEntity<List<ImageVO>> getAttachList(int product_num){
		
		log.info("getAttachList.........." + product_num);
		
		return new ResponseEntity<List<ImageVO>>(productService.getimgList(product_num), HttpStatus.OK);
		
	}
	/* 상품 상세 */
	@GetMapping("/goodsDetail/{product_num}")
	public String goodsDetailGET(@PathVariable("product_num")int product_num, Model model) { 
		//@PathVariable 어노테이션을 사용하면 파라미터로식별자를 넘기지않고 url로 사용할 수 있다	
		log.info("goodsDetailGET()..........");
		model.addAttribute("goodsInfo", productService.getGoodsInfo(product_num));
		
		return "/goodsDetail";
	}
}
