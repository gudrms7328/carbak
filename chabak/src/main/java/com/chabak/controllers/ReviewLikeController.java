package com.chabak.controllers;

import com.chabak.repositories.ReplyDao;
import com.chabak.repositories.ReviewDao;
import com.chabak.repositories.ReviewLikeDao;
import com.chabak.services.MemberService;
import com.chabak.services.ReviewLikeService;
import com.chabak.services.ReviewService;
import com.chabak.utilities.Utility;
import com.chabak.vo.Reply;
import com.chabak.vo.Review;
import com.chabak.vo.ReviewLike;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/reviewLike")
public class ReviewLikeController {

    @Autowired
    ReviewLikeService reviewLikeService;

    @Autowired
    MemberService memberService;



    @ResponseBody
    @RequestMapping(value ={"/toggleAjax"}, method=RequestMethod.POST)
    public int reviewLikeToggle(HttpServletRequest request,HttpSession session,HttpServletResponse response){
        ModelAndView mv = new ModelAndView();

        System.out.print("reviewLike Controller reviewNo:");
        //region checkLogin(세션에서 로그인한 아이디 가져와 설정+비로그인시 로그인 페이지로 이동(return: id or null))
        String id = Utility.getIdForSessionOrMoveIndex(mv,session,response);
        System.out.println("id:"+id);
        if(id==null){
            System.out.println("return -1");
            return -1;
        }

        //endregion
        System.out.println("after of return -1");
        int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
        System.out.println(reviewNo);
        //reviewLike 설정
        ReviewLike reviewLike = new ReviewLike();
        reviewLike.setId(id);
        reviewLike.setReviewNo(reviewNo);

        System.out.println("ReviewLikeController /toggleAjax reviewLike:"+reviewLike);
        //select 결과 저장용 bean

        int resultLikeStatus = reviewLikeService.toggleReviewLike(reviewLike);

        return resultLikeStatus;
    } //리뷰 좋아요 토글


}