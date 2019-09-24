package co.kr.khaki.controller;

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
import co.kr.khaki.member.AuthNumber;
import co.kr.khaki.member.MemberDTO;
import co.kr.khaki.member.SocialDTO;
import co.kr.khaki.notice.NoticeDAO;
import co.kr.khaki.notice.NoticeDTO;

@Controller
public class HomeController {
   
   @Autowired
   NoticeDAO noticeDAO;
   @Autowired
   BoardDAO boardDAO;
   @Autowired
   CarDAO carDAO;
   
   @RequestMapping("home.do")
   public String home(Model model) {
      // 공지사항 5개
      List<NoticeDTO> noticeList = noticeDAO.selectFive();
      model.addAttribute("noticeList", noticeList);
      // 자유게시판 추천순 5개
      List<BoardDTO> boardList = boardDAO.selectFive();
      model.addAttribute("boardList", boardList);
      
      return "home/home";
   }
   
   @RequestMapping("showNewCar.do")
   public String showNewCar(Model model) {
      List<NewCarDTO> list = carDAO.selectThree();
      System.out.println(list.get(0).getCar_name());
      model.addAttribute("list", list);
      
      return "home/showNewCar";
   }
   
   
}