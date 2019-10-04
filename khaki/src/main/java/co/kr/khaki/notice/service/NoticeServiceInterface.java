package co.kr.khaki.notice.service;

import java.util.ArrayList;

import co.kr.khaki.notice.DTO.NoticeDTO;

public interface NoticeServiceInterface {

	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#board(org.springframework.ui.Model, int, int)
	 */
	ArrayList board(int curPage, int pageSize);

	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#noticeInsertProcess(co.kr.khaki.notice.DTO.NoticeDTO, org.springframework.ui.Model, int, int)
	 */
	ArrayList noticeInsertProcess(NoticeDTO noticeDTO, int curPage, int pageSize);

	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#noticeUpdate(co.kr.khaki.notice.DTO.NoticeDTO, org.springframework.ui.Model)
	 */
	NoticeDTO noticeUpdate(NoticeDTO noticeDTO);

	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#noticeUpdate2(co.kr.khaki.notice.DTO.NoticeDTO, org.springframework.ui.Model, int, int)
	 */
	ArrayList noticeUpdate2(NoticeDTO noticeDTO, int curPage, int pageSize);

	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#noticeSelect(co.kr.khaki.notice.DTO.NoticeDTO, org.springframework.ui.Model)
	 */
	NoticeDTO noticeSelect(NoticeDTO noticeDTO);

	/* (non-Javadoc)
	 * @see co.kr.khaki.notice.service.NoticeServiceInterface#noticeDelete(co.kr.khaki.notice.DTO.NoticeDTO, org.springframework.ui.Model, int, int)
	 */
	ArrayList noticeDelete(NoticeDTO noticeDTO, int curPage, int pageSize);

}