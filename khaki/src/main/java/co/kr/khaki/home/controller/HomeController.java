package co.kr.khaki.home.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import co.kr.khaki.board.BoardDAO;
import co.kr.khaki.board.BoardDTO;
import co.kr.khaki.car.CarDAO;
import co.kr.khaki.car.NewCarDTO;
import co.kr.khaki.common.AuthNumber;
import co.kr.khaki.home.service.HomeServiceImpl;
import co.kr.khaki.home.service.HomeServiceInter;
import co.kr.khaki.member.DTO.MemberDTO;
import co.kr.khaki.member.DTO.SocialDTO;
import co.kr.khaki.notice.DAO.NoticeDAO;
import co.kr.khaki.notice.DTO.NoticeDTO;

@Controller
public class HomeController {
   
   @Autowired
   HomeServiceInter homeServiceInter;
   
   @RequestMapping("home.do")
   public String home(Model model) {
      // 공지사항 5개
      List<NoticeDTO> noticeList = homeServiceInter.selectNoticeFive();
      model.addAttribute("noticeList", noticeList);
      // 자유게시판 추천순 5개
      List<BoardDTO> boardList = homeServiceInter.selectBoardFive();
      System.out.println(boardList.size());
      model.addAttribute("boardList", boardList);
      return "home/home";
   }
   
   @RequestMapping("showNewCar.do")
   public String showNewCar(Model model) {
	// 신규 등록 차량 3대
   List<NewCarDTO> list = homeServiceInter.selectCarThree();
   System.out.println(list.get(0).getCar_name());
   model.addAttribute("list", list);
      
      return "home/showNewCar";
   }
   
   
}