package com.ace.thrifty.ptj.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ace.thrifty.admin.model.vo.Notice;
import com.ace.thrifty.board.model.dao.BoardDao;
import com.ace.thrifty.board.model.vo.Board;
import com.ace.thrifty.board.model.vo.Image;
import com.ace.thrifty.common.Utils;
import com.ace.thrifty.common.model.vo.PageInfo;
import com.ace.thrifty.common.template.Pagination;
import com.ace.thrifty.member.model.vo.Member;
import com.ace.thrifty.ptj.model.dao.PtjDao;
import com.ace.thrifty.ptj.model.vo.Ptj;
import com.ace.thrifty.usedProduct.model.vo.UsedProduct;

@Service
public class PtjServiceImpl implements PtjService {
   
   @Autowired
   PtjDao ptjDao;
   
   @Autowired
   BoardDao boardDao;
   
   @Autowired
   private Pagination pagination;
   
   @Override
   public Ptj selectPtjDetail(int bNo) {
      
      Ptj p =  ptjDao.selectPtjDetail(bNo);
      if(p != null) {
         boardDao.increaseReadCount(bNo);
         p.getBoard().setReadCount(p.getBoard().getReadCount()+1);
      }
      return p;
   }
   

   @Override
    public List<Ptj> selectPtj() {
       return ptjDao.selectPtj();
    }
    
   
   
    @Override 
    public void selectPtjAll(Map<String, Object> queryString) {
      int listCount = ptjDao.selectPtjCount(queryString);
      int pageLimit = 10;
      int boardLimit = 9;
      PageInfo pi = pagination.getPageInfo(listCount, Integer.parseInt((String)(queryString.get("currPage"))), pageLimit, boardLimit);
      List<Ptj> list = ptjDao.selectPtjAll(pi, queryString);
      
      queryString.put("pi", pi);
      queryString.put("list", list);
     
    }
    
   
   @Transactional(rollbackFor = {Exception.class})
   @Override
   public int insertPtj(Board b , Ptj p , MultipartFile image, String webPath, String serverFolderPath) throws Exception {
      boardDao.insertBoard(b);
      int boardNo = b.getBoardNo();
      int result = 0;
      if(boardNo > 0 && image != null) {
         p.setBoardNo(boardNo);
         result = ptjDao.insertPtj(p);
      }
      
      if(result > 0 && image != null) {

               String changeName = Utils.saveFile(image , serverFolderPath);
               
               Image img = new Image();
               img.setBoardNo(boardNo);
               img.setFileLevel(0);
               img.setOriginName(image.getOriginalFilename());
               img.setChangeName(changeName);
               boardDao.insertImage(img);
      }
      return boardNo;
   }
   
   @Override
   public int deleteBoard(Board b) {
      
      return boardDao.deleteBoard(b);
      
   }
   
   @Override
   public Ptj updateFormPtj(int boardNo) {
      return ptjDao.updateFormPtj(boardNo);
   }
   
   @Transactional(rollbackFor = {Exception.class})
   @Override
   public int updatePtj(Ptj p , Board b , Image img, String webPath, String serverFolderPath) throws Exception{
      
      int result = ptjDao.updatePtj(p);
      int result2 = boardDao.updateBoard(b);
      p.getImgPath();

      System.out.println(result);
      System.out.println(result2);
      if(p.getImgPath() != null) {
         ptjDao.deleteImage(b);
      }
      
      if(img != null) {
         boardDao.insertImage(img);
      }
      return 0;
   }
      
      
   
   @Override
   public int workEnd(Board b) {
      return ptjDao.workEnd(b);
   }
}