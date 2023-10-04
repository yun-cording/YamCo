package com.yamco.user.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import javax.annotation.PostConstruct;

import com.yamco.user.model.dao.Random_DAO;
import com.yamco.user.model.vo.Random_VO;
import com.yamco.user.model.vo.Random_save_VO;

@Service
public class RandomService {
	 private List<Random_VO> fileList = new ArrayList<Random_VO>();
	 private Random_VO selectedFile;
	 private Random_save_VO saveVO = new Random_save_VO();  
	 
	 	//@PostConstruct 어노테이션은 Spring Framework에서 빈(Bean) 객체가 초기화될 때 
	 	// 호출되는 메서드에 붙이는 어노테이션입니다. 빈이 생성되고 의존성 주입이 끝난 후, 
	 	// 해당 빈이 사용되기 전에 초기화 작업을 수행하기 위해 사용
	 	@Autowired
		private Random_DAO random_DAO ;
	 
		  @PostConstruct public void initializeFileList() {
		  
		  fileList = random_DAO.getRandomList(); updateSelectedFile();
		  
		  }
		 
	    
	    // 매일 자정에 호출되는 메서드  @Scheduled(cron = "0 0 0 * * ?")
	    @Scheduled(cron = "0 */3 * * * ?") // 테스트용 3분 간격
	    public void updateSelectedFile() {
	        Random random = new Random();
	        while (true) {
	        	Random_VO newSelectedFile = fileList.get(random.nextInt(fileList.size()));
	            if (!newSelectedFile.equals(selectedFile)) {
	                selectedFile = newSelectedFile;
	                break;
	            }
	        }
	        saveVO.setFoodsave_img(selectedFile.getFood_img());
	        saveVO.setFoodsave_title(selectedFile.getFood_title());
	        int result = random_DAO.getRandomSave(saveVO);
	        
	    }
	    
	    public Random_save_VO getSelectedFile() {
	    	saveVO = random_DAO.getRandomFile();
	    	 
	        return saveVO;
	    }
	    
	    
}
