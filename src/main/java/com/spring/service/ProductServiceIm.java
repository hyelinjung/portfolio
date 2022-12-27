package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CateVO;
import com.spring.domain.Criteria;
import com.spring.domain.ImageVO;
import com.spring.domain.ProductVO;
import com.spring.mapper.Product;

@Service
public class ProductServiceIm implements ProductService {

	@Autowired
	private Product product;

	@Override
	public void productinsert(ProductVO vo) {
		product.productinsert(vo);//상품정보 등록시킴(이미지 뺴고)
			//이미지 저장
		if(vo.getImageList() == null || vo.getImageList().size() <= 0) { //이미지 선택안했을경우 밑에 이미지 저장함수 실행 안시키기 위해
			return;
		}
		vo.getImageList().forEach(imageVO -> { //상품vo에 저장된 이미지 객체 수만큼 돌리면서 쿼리문을 통해서 저장한 상품번호를 이미지vo안에 저장시킴

			imageVO.setProduct_num(vo.getProduct_num());
			product.imageinsert(imageVO); //상품번호까지 저장된vo를 갖고 쿼리문을 실행시켜 db에 저장

		});

	}

	@Override
	public List<CateVO> cateList() { //카테고리 리스트 저장

		return product.cateList();
	}

	@Override
	public List<ProductVO> productList(Criteria cri) { //상품 리스트 불러오기
		List<ProductVO> list =product.productList(cri);  //cri변수를 파람으로 받아 상품리스트들을 불러와 저장
		list.forEach(productvo -> { //리스트가 가지고 있는 인덱스 수 만큼 돌린다
			int a =productvo.getProduct_num(); //이미지도 불러오기 위해서 이미지 쿼리 실행할 파라미터(상품번호)를 구한다
			System.out.println(a);
			List<ImageVO> imageVO =product.getimgList(a); //상품vo에 저장하기위해서 얻은 파라미터(상품번호)를 가지고 상품 리스트를 구해와 list객체에 저장
			System.out.println(imageVO);
			productvo.setImageList(imageVO); //상품vo에있는 setImageList 변수에 저장한다
			
		});
		

		return list ;
	}

	@Override
	public int totalList(Criteria cri) { //총갯수를 구해서 페이지를 구하기위해

		return product.totalList(cri);
	}

	@Override
	public ProductVO productDetail(int product_num) { //상품 정보 보기

		return product.productDetail(product_num);
	}

	@Override
	public void proModify(ProductVO vo) { //상품 수정
		product.proModify(vo);

	}

	@Override
	public int proDelete(int product_num) { //상품삭제

		return product.proDelete(product_num);
	}

	@Override
	public List<ImageVO> getimgList(int product_num) { //이미지 디테일에서 사진 불러오기위해서(db에서 꺼내옴)
		return product.getimgList(product_num);
	}

	@Override
	public ProductVO getGoodsInfo(int product_num) { //일반 사용자가 상품 디테일을 볼수 있도록
		ProductVO vo =product.getGoodsInfo(product_num); //파라미터 상품번호에따른 정보를 vo변수에 저장
		vo.setImageList(product.getimgList(vo.getProduct_num())); // vo변수에서 상품번호를 얻어와 이미지를 얻어서 vo에 저장
		return vo;
	}

}
