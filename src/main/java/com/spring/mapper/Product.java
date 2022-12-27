package com.spring.mapper;

import java.util.List;

import com.spring.domain.CateVO;
import com.spring.domain.Criteria;
import com.spring.domain.ImageVO;
import com.spring.domain.ProductVO;

public interface Product {
	/* 상품 등록 */
	public void productinsert(ProductVO vo);
	public List<CateVO> cateList();
	
	/* 상품 리스트 */
	public List<ProductVO> productList(Criteria cri);
	
	/* 상품 총 개수 */
	public int totalList(Criteria cri);
	/* 상품 조회 페이지 */
	public ProductVO productDetail(int product_num);
	/* 상품 수정 */
	public void proModify(ProductVO vo);
	/* 상품 정보 삭제 */
	public int proDelete(int product_num);
	/* 이미지 등록 */
	public void imageinsert(ImageVO imageVO);
	/* 이미지 데이터 반환 */
	public List<ImageVO> getimgList(int product_num);
	/* 상품 정보 */
	public ProductVO getGoodsInfo(int product_num);
}
