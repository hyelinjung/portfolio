package com.spring.project;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.CartVO;
import com.spring.domain.ImageVO;
import com.spring.domain.ProductVO;
import com.spring.mapper.Cart;
import com.spring.mapper.Product;
import com.spring.service.CartService;
import com.spring.service.ProductService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapperTests {

	@Autowired
	private Product product;
	@Autowired
	private ProductService productService;
	@Autowired
	private Cart cartmapper;
@Autowired
private CartService service;
	
	/*
	 * @Test public void test() throws Exception { ProductVO vo = new ProductVO();
	 * vo.setCateCode("100"); vo.setP_code("test"); vo.setP_content("test");
	 * vo.setP_Discount(0.23); vo.setP_info("test"); vo.setP_name("test");
	 * vo.setP_price(1); vo.setP_Stock(11); System.out.println("비포 vo" + vo);
	 * 
	 * product.productinsert(vo); System.out.println("후 vo" + vo);
	 * 
	 * }
	 */
	/* 이미지 등록 */
	/*
	 * @Test public void imageEnrollTest() {
	 * 
	 * ImageVO vo = new ImageVO();
	 * 
	 * vo.setProduct_num(4383); vo.setUploadFileName("test");
	 * vo.setUploadPath("test"); vo.setUuid("test2");
	 * 
	 * product.imageinsert(vo);
	 * 
	 * }
	 */
	
	/* 상품 등록 & 상품 이미지 등록 테스트 */
	/*
	 * @Test public void bookEnrollTEsts() {
	 * 
	 * ProductVO vo = new ProductVO(); vo.setCateCode("100"); vo.setP_code("test");
	 * vo.setP_content("test"); vo.setP_Discount(0.23); vo.setP_info("test");
	 * vo.setP_name("test"); vo.setP_price(1); vo.setP_Stock(11);
	 * System.out.println("비포 vo" + vo); // 이미지 정보 List<ImageVO> imageList = new
	 * ArrayList<ImageVO>();
	 * 
	 * ImageVO image1 = new ImageVO(); ImageVO image2 = new ImageVO();
	 * 
	 * image1.setUploadFileName("test Image 1");
	 * image1.setUploadPath("test image 1"); image1.setUuid("test1113");
	 * 
	 * image2.setUploadFileName("test Image 2");
	 * image2.setUploadPath("test image 2"); image2.setUuid("test2224");
	 * 
	 * imageList.add(image1); imageList.add(image2);
	 * 
	 * vo.setImageList(imageList);
	 * 
	 * // bookEnroll() 메서드 호출 productService.productinsert(vo);
	 * 
	 * System.out.println("등록된 VO : " + vo);
	 * 
	 * 
	 * }
	 */
	
	/* 상품 정보 */
	/*
	 * @Test public void getGoodsInfo() { int product_num = 4383; ProductVO
	 * goodsInfo = product.getGoodsInfo(product_num);
	 * System.out.println("===========================");
	 * System.out.println(goodsInfo);
	 * System.out.println("===========================");
	 * 
	 * }
	 */

	/*상품 상세 정보*/
	/*
	 * @Test public void getGoodsInfoTest() {
	 * 
	 * int product_num = 4383;
	 * 
	 * ProductVO goodsInfo = productService.getGoodsInfo(product_num);
	 * 
	 * System.out.println("==결과=="); System.out.println("전체 : " + goodsInfo);
	 * System.out.println("product_num : " + goodsInfo.getProduct_num());
	 * System.out.println("이미지 정보 : " + goodsInfo.getImageList().isEmpty());
	 * 
	 * 
	 * }
	 */

	@Test
	public void addCart() throws Exception {
		String memberId = "admin23";
		int product_num = 4383;
		int count = 2;
		
		CartVO cart = new CartVO();
		cart.setMemberId(memberId);
		cart.setProduct_num(product_num);
		cart.setProductCount(count);
		
		int result = 0;
		result = service.addCart(cart);
		
		System.out.println("결과 : " + result);
		
	}	

	
	

	/*
	 * @Test public void deleteCartTest() { int cartId = 1;
	 * 
	 * mapper.deleteCart(cartId);
	 * 
	 * 
	 * 
	 * 
	 * @Test public void modifyCartTest() { int cartId = 3; int count = 5;
	 * 
	 * CartDTO cart = new CartDTO(); cart.setCartId(cartId);
	 * cart.setBookCount(count);
	 * 
	 * mapper.modifyCount(cart);
	 * 
	 * }
	 * 
	 * 
	 * 
	 * @Test public void getCartTest() { String memberId = "admin";
	 * 
	 * 
	 * List<CartDTO> list = mapper.getCart(memberId); for(CartDTO cart : list) {
	 * System.out.println(cart); cart.initSaleTotal();
	 * System.out.println("init cart : " + cart); }
	 * 
	 * 
	 * 
	 * }
	 * 
	 * @Test public void checkCartTest() {
	 * 
	 * String memberId = "admin"; int bookId = 71;
	 * 
	 * CartDTO cart = new CartDTO(); cart.setMemberId(memberId);
	 * cart.setBookId(bookId);
	 * 
	 * CartDTO resutlCart = mapper.checkCart(cart); System.out.println("결과 : " +
	 * resutlCart);
	 * 
	 * }
	 */
}
